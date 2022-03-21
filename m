Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED94E2368
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:36:20 +0100 (CET)
Received: from localhost ([::1]:57464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWESZ-0004DW-ML
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:36:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nWEQ4-0001nG-FE
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:33:44 -0400
Received: from [2607:f8b0:4864:20::62a] (port=43609
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nWEQ2-0007ut-NJ
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:33:44 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w8so12182865pll.10
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 02:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rAQY9QpiDnP0xJqP5z/33KuG1EP0N88+QR8uSKu21no=;
 b=lbLMdesAgQwkM+LvihFVhrCgX8zj/3C2KzecU44x4kuj5q54MeT+UCTUzNJWwpmQTP
 10DG6D4+4USsbG3xltBSkvVkXCfDPGTNuJXvgFsZ3Dv1dunteRJVIpZimTOxLxbHqXLK
 po4k2i6tTYWu9c9tyWc54MvZP1O2TehDzP3WPu5Epapgbe6vXx8EBEOGSWgDshzuxhsq
 aY9nokwL6zEkBPkw3jjbohTN59VdT2KeQsWpQNTEhVg2MsX2nKBwAXzB3s3Cx4zWvEA+
 dmNEXukH7k5r5qqUbF5H5znGbmf1Kmy1d9U4iKT1X9TSZog6K7tT9MOCRqJl6+sCDfbl
 8yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rAQY9QpiDnP0xJqP5z/33KuG1EP0N88+QR8uSKu21no=;
 b=PFbF9l+q9gIL2XE3ZXka/p80dx2tCk87/ZHA4I7u7Yqwjf2jeX/gE0mMqGmbwPikFL
 MYMQnR2aSYNUqvVG9cMWQYAiX3zXcJMq1fxo2E8RWwwQk2UrzIpdX05N9lLO1WzkO99U
 VgWt9GaY+whlARQ3NMx1S+X8AGGvJr0/bleT1LHbOezdr7Zf45sM08wRLVGhFyE8UAX+
 LQk2cTABM8oQqOVAQyTbUufTvY7KOygySxjbltDo9pzmj+hEPDVRMqEWsnFYMoOXz6kx
 uKwQ+ksrV574A2c21JUG0JWPdNbMU6gLnN8fnhnL5Onf0cu0zW2nckqelQwE2qA0DBvO
 Inhw==
X-Gm-Message-State: AOAM530iGJu/PqKg2DLnC4IOrTFc270ENDfR1k9Ex5Koc5ry4WmwCjST
 27YOpa8QpGZGCNPL1ORRdzU=
X-Google-Smtp-Source: ABdhPJzmL02lk2GYkvy9aSzAiNo76+o2eVvVQMpwU2r/qxk7yzioqXjKtV5QLurkyMRykIhQWoqkzw==
X-Received: by 2002:a17:90b:1e04:b0:1c6:fbac:b0e2 with SMTP id
 pg4-20020a17090b1e0400b001c6fbacb0e2mr7013146pjb.207.1647855219873; 
 Mon, 21 Mar 2022 02:33:39 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a63e750000000b00373598b8cbfsm14120210pgk.74.2022.03.21.02.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 02:33:39 -0700 (PDT)
Message-ID: <b4781f22-81cc-54dd-59b1-774439a01576@gmail.com>
Date: Mon, 21 Mar 2022 18:33:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH-for-7.0 v4 0/2] cocoa: run qemu_init in the main thread
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220317125534.38706-1-philippe.mathieu.daude@gmail.com>
 <342e06e6-8d38-d068-5686-eb13c70da93b@gmail.com>
 <d74d6213-09ef-b835-e3e3-16b00a42f3e8@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <d74d6213-09ef-b835-e3e3-16b00a42f3e8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/03/21 18:14, Paolo Bonzini wrote:
> On 3/19/22 14:56, Philippe Mathieu-Daudé wrote:
>>>    1. Move setgid and setuid calls after [+NSApplication
>>>    sharedApplication] to let NSApplication initialize as the original
>>>    user.
> 
> Another possibility is to move the code up to "[QemuApplication 
> sharedApplication]" from main() to cocoa_display_init().
> 
> Paolo

I'm for moving everything except [NSApp run] to cocoa_display_init().

This series moved Cocoa display initialization code to 
[-QemuCocoaApplicatinController applicationDidFinishLaunching:] to keep 
the initialization order for Cocoa, but it is unlikely that doing 
initialization things before [-QemuCocoaApplicatinController 
applicationDidFinishLaunching:] would cause problems. (The only Apple 
thing affected by the change would be dispatch_sync, which is rarely 
used.) The code movement is rather intrusive for QEMU as found with this 
"runas" problem.

Doing Cocoa initialization things in [-QemuCocoaApplicatinController 
applicationDidFinishLaunching:] and after the method call can be even 
dangerous as it would modify the state of Cocoa, which is already 
running. "Create menus in iothread" patch series actually triggered such 
a problem and required careful coding:
https://patchew.org/QEMU/20220321041043.24112-1-akihiko.odaki@gmail.com/

The code movement also requires more code to keep the content of 
DisplayOptions and to have the definition of 
[-QemuCocoaApplicatinController applicationDidFinishLaunching:]. It 
would be simply nice if we could remove them.

Regards,
Akihiko Odaki

