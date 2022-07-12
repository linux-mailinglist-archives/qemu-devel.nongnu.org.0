Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8167B57172B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:21:26 +0200 (CEST)
Received: from localhost ([::1]:38336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBD1B-0004P7-5D
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBCs0-0002ll-KX
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:11:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBCrx-0008UT-BF
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657620712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3twIriUCbeb0cwm/mbU36wGDIcoHPyRsqv2j7dMFglY=;
 b=ZUzHF+SXbh3ndTA80ToOQ6c7PbjcsOrmLM9WnFlmwLURTpXwPnPEO8bSjT9Xo9+tVht0dB
 Y4cAsBLa3YfFZUg3yBNkioo0Th/L5flFVRsFCvXAcuY1bEXaTfJN5yhDzyY/gMxYSyApHg
 T0cs/9ZE4vuQSFVHguczgBoo/Sie+uE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-pm4ClPjwOem4T7E7RLXfow-1; Tue, 12 Jul 2022 06:11:51 -0400
X-MC-Unique: pm4ClPjwOem4T7E7RLXfow-1
Received: by mail-wr1-f70.google.com with SMTP id
 k26-20020adfb35a000000b0021d6c3b9363so1259859wrd.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 03:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3twIriUCbeb0cwm/mbU36wGDIcoHPyRsqv2j7dMFglY=;
 b=2op34D+ExQDsLCsKf1u8SIExHv6T63ZdI+4uIE+s0ek9tTvHvHaxZpqGt3hXtfxg9s
 npmwXov8ndUU/fiSmt00wNVGrHZxGE1XeLm+0iUKvFPh9rCvvWoe02e1/4Mv4rCCyjeb
 4ccXfkxPp0ytGMGs9CkfkUvGCNPHcjojSZHTbXHE9F0k5xSD6vbpoJmrrZ/GGLqOq5GA
 fwHjVgXgtosQt8VpOBbXfh4oaHAJXSUuRg8c+UjyyHaPM+DHuFRYaaY4xgqorhfcArWr
 agcG8VzjU/4JeXAyatsaSnR/GjPVyeCLXgif5KMoMvRbMyo61OMERerD/wqa5VMMk/n1
 z98Q==
X-Gm-Message-State: AJIora9d/49HEc8li48c5JCEa4spxuGB7iJ4g6VXHpWkTSJ+g7CJnz+p
 QYV5gyLFp9GY7zguDm/WG66veiNAPUJCIjfEafCcZHZeUXFCefH8L2k3tbqnwPMa3rgdAQYCPWQ
 3ix71qRid1uDd2nw=
X-Received: by 2002:a5d:6d0e:0:b0:21d:6d4c:e0e4 with SMTP id
 e14-20020a5d6d0e000000b0021d6d4ce0e4mr22188497wrq.355.1657620710474; 
 Tue, 12 Jul 2022 03:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1srd+QTsBJsWr8uWyxkMHwAPWK0f9ybszQZccN4IzMcIxVQnRwVA/8DAggayPyY15dbCTxjoQ==
X-Received: by 2002:a5d:6d0e:0:b0:21d:6d4c:e0e4 with SMTP id
 e14-20020a5d6d0e000000b0021d6d4ce0e4mr22188483wrq.355.1657620710301; 
 Tue, 12 Jul 2022 03:11:50 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b0021b9504cc83sm7920078wrm.31.2022.07.12.03.11.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 03:11:49 -0700 (PDT)
Message-ID: <a61804f4-522b-d6e2-b535-2cbcbefdee30@redhat.com>
Date: Tue, 12 Jul 2022 12:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] gtk: Add show_tabs=on|off command line option.
Content-Language: en-US
To: =?UTF-8?Q?Felix_Quei=c3=9fner?= <ikskuh@mailbox.org>, qemu-devel@nongnu.org
Cc: "kraxel@redhat.com" <kraxel@redhat.com>,
 "thuth@redhat.com" <thuth@redhat.com>, "Zhang, Chen" <chen.zhang@intel.com>
References: <20220627164404.12137-1-xq@random-projects.net>
 <3026dec8-3bad-6996-956d-6d8407263be5@mailbox.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <3026dec8-3bad-6996-956d-6d8407263be5@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 12.07.22 09:35, Felix Queißner wrote:
> Heya!
>
> On 27.06.22 18:44, Felix xq Queißner wrote:
>> The patch adds "show_tabs" command line option for GTK ui similar to 
>> "grab_on_hover". This option allows tabbed view mode to not have to 
>> be enabled by hand at each start of the VM.
>
> On 30.06.22 16:09, Hanna Reitz wrote:
> > [snip]
>
> On 30.06.22 16:53, Markus Armbruster wrote:
> > [snip]
>
> On 01.07.22 12:00, Gerd Hoffmann wrote:
> > [snip]
>
> I have addressed the things mentioned:
> - limiting line length to 80 in ui.json, qemu-options.hx
> - limiting line length in commit to 72
> - improved description of the option as Hanna suggested
>
> On 01.07.22 11:14, Zhang, Chen wrote:
> >> Signed-off-by: Felix "xq" Queißner <xq@random-projects.net>
> >
> > Thanks your patch, but please use your real name to sign a patch.
>
> Not sure what to do about this one. Felix Queißer *is* my real name, 
> so the only thing i could do is to remove the "xq"?

I feel like you can leave it that way because given the quotation marks 
it seems obvious what you real name is.

(FWIW I can see precedent in commit 
f5507e0448bd34473af72509297617a783049024.)

> Should i submit my changes as a response to this or create a new mail 
> thread with a new patch?

Please submit them as a new thread with a “[PATCH v2]” tag (`git 
format-patch -v2` will create that tag).

Hanna


