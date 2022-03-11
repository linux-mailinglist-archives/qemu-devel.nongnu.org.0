Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11354D5BC6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 07:51:14 +0100 (CET)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSZ7J-0006mh-NY
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 01:51:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSZ0h-0005rN-TS
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 01:44:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSZ0e-0005A8-QC
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 01:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646981056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2FHVB0ONcC7Fi4VANNQ7ctOpG/P6AaF5qMuHBHXY18=;
 b=SKJ+kQT+ilVHUBjdwCqh73pxQDXbnSkWFmQIETJ4IovVMY8rCILmN7TiPRUGlEozmqKrSR
 MyrL1nZTBis5vGqibDaV60FqC2Mqy6QtEp58+jIGgTaXGlBuuz44NvhG8rRj5h/LfG4X3T
 VtAae5WmZZbVbjIlmE5Nzi+7NMH6k8M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-XUts2mA2NUCTObeYs4DlqQ-1; Fri, 11 Mar 2022 01:44:15 -0500
X-MC-Unique: XUts2mA2NUCTObeYs4DlqQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 o9-20020adfca09000000b001ea79f7edf8so2447709wrh.16
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 22:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/2FHVB0ONcC7Fi4VANNQ7ctOpG/P6AaF5qMuHBHXY18=;
 b=vd/S1ckzg6oFGQfhik5bJISxQKj/Jsbd1yM8wcXl94jZogqadT0jA72MNHQnphr0SZ
 0kcSIVPrvdoyFuxTGWqnR2VvK5AA1bYdTAXELkRByyyHanKg72SCPjp10rqm/7BTKApG
 mwRr5y3NO7xHdpuTPJnokijN5u3gW9AbbfCr5QGhCFD8M9ASbBllig8WCf/FFbzYAuKf
 OzXj6tdhajWEj5xgREo4JOPMOMGfK61Wx3QtwPEzfoZsd2z86aypQhusc/O2ByvNqcEH
 qdPQX56VQR5mqTCCrr/peiXAehgGZ3UNzTizsYtQBQRaikxY6ZL5qe0RA/06r0YeG1xu
 LAIQ==
X-Gm-Message-State: AOAM5303uqIGc+/2yLeaa0jWhk6TIZ4RMa6pYi4v1MP8R+NJhX0bnMEb
 DwnES7VcRMkdsxVdal9A1cZvy27gxiSQDel4LwPok3bLI+sab8juPpgxBjC2JvAYQYgi35p38GE
 81a3W7imo3GTp+K4=
X-Received: by 2002:a1c:2544:0:b0:381:18a:a46d with SMTP id
 l65-20020a1c2544000000b00381018aa46dmr6309394wml.26.1646981054112; 
 Thu, 10 Mar 2022 22:44:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5Te5X0oIfldoJv1alB83QgcA35pAu+aj9Mpn/o5oAoWHtETHTeYI/JX37Np3TRsDVk2nQ3g==
X-Received: by 2002:a1c:2544:0:b0:381:18a:a46d with SMTP id
 l65-20020a1c2544000000b00381018aa46dmr6309379wml.26.1646981053856; 
 Thu, 10 Mar 2022 22:44:13 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 f15-20020a0560001a8f00b0020397ea11d2sm460529wry.20.2022.03.10.22.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 22:44:13 -0800 (PST)
Message-ID: <dd0dfcb5-30ca-c998-4899-fe9e353ef179@redhat.com>
Date: Fri, 11 Mar 2022 07:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/3] tcg/s390x: Fix INDEX_op_bitsel_vec vs VSEL
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220310202751.594961-1-richard.henderson@linaro.org>
 <20220310202751.594961-3-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220310202751.594961-3-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 21.27, Richard Henderson wrote:
> The operands are output in the wrong order: the tcg selector
> argument is first, whereas the s390x selector argument is last.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/898
> Fixes: 9bca986df88 ("tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/s390x/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
> index 508f1bccc7..3b185b3c96 100644
> --- a/tcg/s390x/tcg-target.c.inc
> +++ b/tcg/s390x/tcg-target.c.inc
> @@ -2868,7 +2868,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
>           break;
>   
>       case INDEX_op_bitsel_vec:
> -        tcg_out_insn(s, VRRe, VSEL, a0, a1, a2, args[3]);
> +        tcg_out_insn(s, VRRe, VSEL, a0, a2, args[3], a1);
>           break;
>   
>       case INDEX_op_cmp_vec:

Thank you very much, this indeed fixes the sha512 tet for me!

Tested-by: Thomas Huth <thuth@redhat.com>


