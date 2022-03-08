Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F91D4D1654
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 12:33:28 +0100 (CET)
Received: from localhost ([::1]:56236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRY5n-0006LK-GI
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 06:33:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY3f-0004aN-Vt
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:31:16 -0500
Received: from [2a00:1450:4864:20::62b] (port=40647
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nRY3c-0005Nm-CB
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 06:31:15 -0500
Received: by mail-ej1-x62b.google.com with SMTP id p15so38522518ejc.7
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 03:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fqUEGFdEubos+x/rXC4UrtkX8KmwYuY1XZPdyOLYC8w=;
 b=I7vewhGu2M/u2EG4JHxQ8otisM1ywjTcSOSEqnlJGFjl/qLmetyuV2sjHmFRGnniR1
 dtLZv/n6Mq9WqtIFIrCHtIlze+GMGK8ROZOWjPdCSehj14gxsiW9EErA3frIWQGsJU+A
 hy08TRPB0fbeHXUy/9FZeRxoO9mxD9te8gPIHasXKl0+C9wHsu0N90bThpiWz4w4Avyi
 dUPzhW55O7ZY43/1IKKtY8UqcQAV8XtPGOwND8IDJSjDqPWlhBLkylbh4zZwx0syUB7L
 e3zfCKpgyc2+nlso+QSC9tL41uQvoHWoOmcjLOQUheR1STkZrpUid9UjLMbYnbMi70YD
 Tfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fqUEGFdEubos+x/rXC4UrtkX8KmwYuY1XZPdyOLYC8w=;
 b=RwH+zS5Es+bWJkH1ixFLMceZPnOV+yDPVy3TivY+oBfTG5gWLupFMSUimdZDVVO0i6
 GTxAypneYHqQhURC98enarU7uSLbWJwlu6aC7cSs2seThdwt1Yb283Nx8a1wLSfmWGZI
 CXP2sYtquYIX3CnoJSXLteTVlBES5owU2miJRjQjyhxfCy/7Wx5rmGGNf3IJRcQ5pvOI
 UtY5IeD1dg3qs9ay2CqdeNkYOmACtbUfw90mPJ7KJEMntBrdvyo/swSzpB1Y4seP2vGV
 r4c2uzd12hmkC0lmKJW0jsIzADNHWF+9f3Eq9pVdGG++3xIj8vrJ76p2+tjFd/MCdrp5
 6mMQ==
X-Gm-Message-State: AOAM5323dVYCwkud9+ee+BsAcXu+cVX72a0UkQsug4EZWiyQyEP7ZpWs
 7uf8xjFpGlP4/3/ZlCCno4I=
X-Google-Smtp-Source: ABdhPJz+TQprt1SgIfF25a4qO82efJ+4SnYLSrGcWxbI/MxOKnv+eU+Cp8o18OSI+svoUpiwe+Iyxw==
X-Received: by 2002:a17:906:6a01:b0:6da:8143:11e7 with SMTP id
 qw1-20020a1709066a0100b006da814311e7mr13073492ejc.296.1646739070799; 
 Tue, 08 Mar 2022 03:31:10 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm5745114ejd.133.2022.03.08.03.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 03:31:09 -0800 (PST)
Message-ID: <06fed507-e09f-b62a-30cc-046fcdd80760@redhat.com>
Date: Tue, 8 Mar 2022 12:31:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 00/23] QEMU changes for 7.0 soft freeze
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220307181633.596898-1-pbonzini@redhat.com>
 <e6d0fc5a-c1be-41b7-239c-c5db02f21cf1@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <e6d0fc5a-c1be-41b7-239c-c5db02f21cf1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 3/8/22 09:14, Thomas Huth wrote:
> You now need to revert commit db4b2133b8d ('Quote "case not run" lines 
> in TAP mode'), too, which has just been merged yesterday.
> 
> But instead of reverting, couldn't we simply go ahead with my series 
> here instead to restore the output of failed iotests:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg05031.html

That one also drops the progress report of non-failed tests, so I'm not 
sure it's an improvement.  Also the commit message for that one should 
mention that it's a meson bug, IMO we should ask distros to backport the 
trivial fix to --verbose 
(https://github.com/mesonbuild/meson/commit/c3f145ca2b9f5a4cfac3ffe1de7d901a4e8aba10.patch).

Paolo

