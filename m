Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 582053D0140
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 20:08:57 +0200 (CEST)
Received: from localhost ([::1]:50036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5uAq-0007Vr-BQ
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 14:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u9R-0005TZ-5J
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:07:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5u9P-0002Uk-Gp
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 14:07:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626804447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9+wacIt1Cv8aktVDU2pg/+8l2QdbEVe8Tclfj/Odptw=;
 b=aJ2k4a94yksKf4iEwcx0Z1TlorWjDUVc0kL+nUt2WVEDZD31/ssHoNjp8FMdBHf5flyN8B
 XZAmG4VIG/epGNTbS5b/8wZXXCDP5q2RJy1xvfDemjS9HHwOCo5U7MK/HqVhjhnn2Dzg47
 Rm7i67uFq8IO2OV0vWgKL0b9Wrp5Xuc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-wRnilbYDOgydOc-gq3P4NQ-1; Tue, 20 Jul 2021 14:07:25 -0400
X-MC-Unique: wRnilbYDOgydOc-gq3P4NQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r13-20020a7bc08d0000b029023a3f081487so37448wmh.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 11:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9+wacIt1Cv8aktVDU2pg/+8l2QdbEVe8Tclfj/Odptw=;
 b=mZ0NqjrfH9fnR9qBh1cgBSfbwVUyuYBOwPwv6o04yBAtM+VswTOKMZys5oPskewTk8
 AKW4PWteJQcIK1391HAvYNFcdTxRSeED4dZ3Ns7C/7gHXcum5l9wVZCtoWycnUdU8qYU
 +SmJT4ViUt13mv3n10O2b4p9qwfH84sz4rMZJ3W16Pdf91tQUn/RqG1aLbliZvYyRFSO
 rutktle9nXSKoOsCVVk82d7ojLT8xainFz7Vrb3Ql+53rukGfDsS+3W+nacCusvvXwY5
 bMANh4d86CLnQu1Oo2aBnettCx/vkf2SP/hl5DXycvAS6jfUEwaBR2gNUyrD6+sBZNB2
 a2BQ==
X-Gm-Message-State: AOAM530ZIF/ZVQasjV1Jbeddnh2ua1orgspELjKkJin1Q5FIRd+FeAY9
 aFkJezra0uccPDd/fPa/atqImkknq5JW1lyPVD4iv5WIwmKnDo/GaKqi+Ngvy+IQqaVfq4VUY4V
 uS0R2iuF3J4Qdc8E=
X-Received: by 2002:adf:ed0f:: with SMTP id a15mr2975505wro.78.1626804444703; 
 Tue, 20 Jul 2021 11:07:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+vCrOfqofpGuGlLNOXG8qsNekwnVSHcumt73uh4WUJkJ4SZ8GFgOARZdgDG2UD77gfAE8pA==
X-Received: by 2002:adf:ed0f:: with SMTP id a15mr2975482wro.78.1626804444532; 
 Tue, 20 Jul 2021 11:07:24 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id c15sm19938003wmr.28.2021.07.20.11.07.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 11:07:24 -0700 (PDT)
Subject: Re: [PATCH 15/16] vl: Clean up -smp error handling
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-16-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <795731ce-c2ad-1844-e531-e7529dbf9517@redhat.com>
Date: Tue, 20 Jul 2021 20:07:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720125408.387910-16-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 2:54 PM, Markus Armbruster wrote:
> The Error ** argument must be NULL, &error_abort, &error_fatal, or a
> pointer to a variable containing NULL.  Passing an argument of the
> latter kind twice without clearing it in between is wrong: if the
> first call sets an error, it no longer points to NULL for the second
> call.
> 
> machine_parse_property_opt() is wrong that way: it passes @errp to
> keyval_parse() without checking for failure, then passes it to
> keyval_merge().  Harmless, since the only caller passes &error_fatal.
> 
> Clean up: drop the parameter, and use &error_fatal directly.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  softmmu/vl.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


