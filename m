Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3860571C52
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 16:23:50 +0200 (CEST)
Received: from localhost ([::1]:34596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBGnl-0004CL-Cp
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 10:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBGi7-0007HG-MS
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oBGi2-0008Uc-Cy
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 10:17:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657635473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Wd+ZKUhaAabwDRVtHURlHOA6WG1wTbVcnDrPftjLmw=;
 b=PlfVmVWPB1drzgRPyh0vBO7nEdQEslht0TfN/eyGBr9fByFHMVjdo1x27XS/zWAHCntuDU
 FCTXbfNdMoM5bKHChlkB61eYDjrrxP4qVScc9Z3kqJmAv4ozr5cfpUf6UGoxCQKCQQO3wI
 CGG66TuBlqZikFvVQq1xAQedjucmtdI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-Xzp8su3SNqi-ENV1wh7WKg-1; Tue, 12 Jul 2022 10:17:48 -0400
X-MC-Unique: Xzp8su3SNqi-ENV1wh7WKg-1
Received: by mail-ed1-f70.google.com with SMTP id
 y18-20020a056402441200b0043564cdf765so6303396eda.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 07:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7Wd+ZKUhaAabwDRVtHURlHOA6WG1wTbVcnDrPftjLmw=;
 b=ZW745tjYX5azjpVFmrQ7I55lIhg5J7hnZcEv5AVOoGvak6VRC9gsfkCJJ/re/hbi5+
 P2lU55LbMHjZz6tz7NHmZkrSFv0a9QsYTzjFgl4hzwShhHP/mfpij42McuxJ3qhD6bsx
 JJsv3drwsrvKrCNN+KixoBxrnIfffX/UwoLu6h5hW1AjKwqbuuDPvDxcAljAq4a+eu1k
 /Z6vno8Qfzkkd7DJa4hGYkgdepYnANlqQFgAZEm7aCdEL6Q4Y+xbcOqXKFHEyQKBCMhW
 jIS5GArpGp17Fv4jvNSM68ANoDOoXdps0Fk1GTpBYnbOXjya3iViVsRWVC3i6soM9qjx
 U4Rg==
X-Gm-Message-State: AJIora8JEzezH6WlhSHi2MRT1ITWyunNasPBsxgH9lfz7wkpuVI7PJiS
 0cguETke2o7q6XR7oMAROk8uZOKAeY/gin/5UT683xQfcsH2P30XyXw6YCinyPCYfTyRAtHB4Oo
 VeksaAN1sfv0YQko=
X-Received: by 2002:a17:906:4fcb:b0:716:ddcd:d124 with SMTP id
 i11-20020a1709064fcb00b00716ddcdd124mr17501410ejw.488.1657635466427; 
 Tue, 12 Jul 2022 07:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tcb7aqZL1XdNL0P+n0Stk81qUeP6CXmwAI4DnXqRUnKwWLMRpA1/iOXHDUc9r4KwVgDui+pA==
X-Received: by 2002:a17:906:4fcb:b0:716:ddcd:d124 with SMTP id
 i11-20020a1709064fcb00b00716ddcdd124mr17501393ejw.488.1657635466231; 
 Tue, 12 Jul 2022 07:17:46 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a1709067c4400b00726abf9cd8esm3788897ejp.125.2022.07.12.07.17.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 07:17:45 -0700 (PDT)
Message-ID: <2da453f0-136c-8b06-879c-84ac0a4f087c@redhat.com>
Date: Tue, 12 Jul 2022 16:17:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] gtk: Add show_tabs=on|off command line option.
Content-Language: en-US
To: =?UTF-8?Q?Felix_xq_Quei=c3=9fner?= <xq@random-projects.net>,
 qemu-devel@nongnu.org
Cc: thuth@redhat.com, kraxel@redhat.com
References: <20220712133753.18937-1-xq@random-projects.net>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220712133753.18937-1-xq@random-projects.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 12.07.22 15:37, Felix xq Queißner wrote:
> The patch adds "show_tabs" command line option for GTK ui similar to
> "grab_on_hover". This option allows tabbed view mode to not have to be
> enabled by hand at each start of the VM.
>
> Signed-off-by: Felix "xq" Queißner <xq@random-projects.net>
> ---
>   qapi/ui.json    | 7 ++++++-
>   qemu-options.hx | 6 +++++-
>   ui/gtk.c        | 4 ++++
>   3 files changed, 15 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


