Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7642F7525
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:24:26 +0100 (CET)
Received: from localhost ([::1]:50122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0LLF-0004Th-R1
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LHw-0002Zw-PG
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:21:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0LHv-0003fz-7a
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:21:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610702458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9OdiJ8KfdmTysTbQmmgc6B+rAetjlL/92+UFrG/UMM=;
 b=T0fuAX3AY0dkyOsAEPegNs92vpOuwH5IxRdOns8wuE6hDWMxS9D0F9+cr6F84rxeZRKnQJ
 brSEUjOT0Lc16SsycTL61iXAPMr03iqZ9Ke0vFu1INmZGgUyhUlba8AYUwhsWKPolvOJZa
 aS2P9LxFvooKOoeLA3OGfyxMD9hW+DE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-Oieay3qCN4SpBlVRjK-79g-1; Fri, 15 Jan 2021 04:20:56 -0500
X-MC-Unique: Oieay3qCN4SpBlVRjK-79g-1
Received: by mail-ed1-f69.google.com with SMTP id 32so1431267edy.22
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 01:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V9OdiJ8KfdmTysTbQmmgc6B+rAetjlL/92+UFrG/UMM=;
 b=s5LUam0O23lKvxJoEwoyTY84vmZ+mTgh2gORYpd3jswh9VU89YpAdmPpg9vg/sdiHp
 MJVb2BA5JaJP9wvNYfGMhiZ/WVfBgpFxp0hNImYKAgob6D/wmK2jsAt5lUzXliEdDEr4
 FCKilv9WAyJQCEAO7k0WAKogzg96DOwI6Uq6Me7GMyWkEBZNghG9fhaPvKFmTKLRZMLT
 TswgqCuE2tmrDoZqoJ9htiPCXy4FnNtJGim+ahPpjJjPmIsyXELmf391Nhi9Q713r+5R
 /5Grg8LIm16AJYeSfN6su9btP7AiFCHn3E9Yku+MN3AkEA/EHxXYvaPuSXhs3CLUD02B
 hhjw==
X-Gm-Message-State: AOAM531YtEzMA77D4+kS96QHWHmODtR2oyHMEl4qGflfacByL0t7H6UW
 T/U0TuT2sqURDOldH1HNgiBZUTlsj3uAri0nxUCoKwhEjd8/SxsCFiP7Au14oCgBKVyAnXMKLmi
 ECrqALglvcyySecc=
X-Received: by 2002:a17:906:d8b4:: with SMTP id
 qc20mr5037825ejb.451.1610702455608; 
 Fri, 15 Jan 2021 01:20:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZzC/vRTBjuwEJQaeSmzFfxwiD8GKjKtVJCnCcThRavzXtcHt+Fj5Gx21vBArAbuz69OfR2A==
X-Received: by 2002:a17:906:d8b4:: with SMTP id
 qc20mr5037811ejb.451.1610702455446; 
 Fri, 15 Jan 2021 01:20:55 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z22sm1815705edb.88.2021.01.15.01.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 01:20:54 -0800 (PST)
Subject: Re: [PATCH v2 5/7] audio: Don't use '%#' in format strings
To: Zhang Han <zhanghan64@huawei.com>, kraxel@redhat.com
References: <20210115012431.79533-1-zhanghan64@huawei.com>
 <20210115012431.79533-6-zhanghan64@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c192c063-74da-0d48-de8a-51274665e43b@redhat.com>
Date: Fri, 15 Jan 2021 10:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210115012431.79533-6-zhanghan64@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, hunongda@huawei.com, alex.chen@huawei.com,
 zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 2:24 AM, Zhang Han wrote:
> Use '0x' prefix instead of '%#'
> 
> Signed-off-by: Zhang Han <zhanghan64@huawei.com>
> ---
>  audio/dsoundaudio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


