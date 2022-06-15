Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D6954D1B2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 21:36:08 +0200 (CEST)
Received: from localhost ([::1]:56092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1YoB-0006in-JW
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 15:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1Ygz-0001aC-Fq
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:28:41 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1Ygy-0003at-0F
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 15:28:41 -0400
Received: by mail-ed1-x52e.google.com with SMTP id n28so17620621edb.9
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 12:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bsd6+legzAuFom7mohoo/EpA8TcMJkGWWwC2FDU1SM4=;
 b=iBkbHnff1MUw8VFd6KdqfwwrtBGfS0mf/2dxnsH4VWAS9vgaqOuUGQ7v///R2DHsfa
 SXPpXSMeCGinD7LN1TvL6ovMrMbfHZtGWBO7ZONczAM+/oitRFKheoT82FmKyf5X3Fgf
 Emi8Wtg+xFam3gSg5mwraA6zl6/aPIU+5LxvEQQaFBUftKGWm/ZToyALIqjHk0rJphlh
 B1kPyUyMabymzBWZ/jAr47+f7NurMg4yRe+IAjNEElaLxce55EBaF0hxFETdwx+b0B2m
 vFzMJfSa6zVdpJoi496TWDZEte6W+SiFjQ/8uf0UqbubXUmUnlrcEFocvEVzfTxExjto
 ifcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bsd6+legzAuFom7mohoo/EpA8TcMJkGWWwC2FDU1SM4=;
 b=Sb3fAjSswPX53jrLOQ+uIt2TVoiAi9DDzqUBMbKvxt5mPM/S1wgycfPCf8S/IAbDWi
 lzhzE87M4wZK8ItRtYFOf1SIqDBp2TsxBxUSrs0h2yCcTI5ZWXJrlnatDFnVJ9TAn7Hd
 6vrpO2u+NuZOW/EzF24dMRSxjiPP33CNkhGMeygcBUZB9260SfdF+NYq02yx5+r6TO6E
 pZWd0MuynoB4DQRML5WocDUYpeSJm5j1WjOXZAO/pxUC+xEL8f9vnHfWEDAp7eVNkSTY
 fPOCko7/cQuFel6bplUxsjzNnKcrIt5Ws1avh+bxsqYXDzCS/b3qVYuAJ9TvmbaWWg99
 WZ2g==
X-Gm-Message-State: AJIora8t3DzBHBGu/uXBy2n9K5SpTaw6Cb2JXIwabkkIS4icFYohxgX0
 SAD738thh/BOZKNrnEhsxuw=
X-Google-Smtp-Source: AGRyM1scsiecQj5NP5JX6caqfaXGRDKJDMPJkWkhTxXbRarhaOY3TVMGm1ifde+O2XP+RgzJDkFIKA==
X-Received: by 2002:a05:6402:f:b0:42e:561:a1c0 with SMTP id
 d15-20020a056402000f00b0042e0561a1c0mr1640379edu.309.1655321318349; 
 Wed, 15 Jun 2022 12:28:38 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 me2-20020a170906aec200b0070aaad0a173sm6596397ejb.192.2022.06.15.12.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 12:28:37 -0700 (PDT)
Message-ID: <ce778937-f051-14c2-65b4-0341850c21fa@redhat.com>
Date: Wed, 15 Jun 2022 21:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7 0/6] cutils: Introduce bundle mechanism
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220615173345.32456-1-akihiko.odaki@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220615173345.32456-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/15/22 19:33, Akihiko Odaki wrote:
> Developers often run QEMU without installing. The bundle mechanism
> allows to look up files which should be present in installation even in
> such a situation.
> 
> It is a general mechanism and can find any files located relative
> to the installation tree. The build tree must have a new directory,
> qemu-bundle, to represent what files the installation tree would
> have for reference by the executables.
> 
> v7: Properly fix --firmwarepath (Daniel P. Berrangé)

Please give people a little time to review.  I left more comments on v6.

Paolo

