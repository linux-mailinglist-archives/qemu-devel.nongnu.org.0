Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0858754C723
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 13:05:37 +0200 (CEST)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Qq7-0007Fj-Iu
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 07:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1Qmv-0005gk-KO
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:02:17 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1o1Qmt-0003YN-V3
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:02:17 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w17so7346996wrg.7
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 04:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zy6hkqQyA2Ds2iGQ0X07j3FMlGMiZB1l2Qm/eaD2bDU=;
 b=dvOSy0nWYioXxZq11V+8HW1X2Ew1LjeG+YZTrCACEhHV7JJYbwa2HKf8PGrw0PkrZi
 3YQobofmE4QvGQBCoGUbKmeHWUSZzSEoXuvHTZpO0CY/RvmeJfSyH1GdR6OPmrDw5UuN
 5cOnKyzH2qZvpBYV32rhpjefJuuFZqVpUgzbhOlBqyifDP4GtOWQpzOmTZffBG6CU75r
 jTTVFlO5njcPBLyecQU46cugsAPGstZ4nwo9CgPLFpX4wO3f3s832Z6oDbyTobchkvRT
 0V+A3q9HNjkt9a+ibVImr4rp8MnTMHljjVPB7Dg2qyOY8R+4qWXK1NPl0h2J02x+P29B
 TaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zy6hkqQyA2Ds2iGQ0X07j3FMlGMiZB1l2Qm/eaD2bDU=;
 b=SxncY6GNbYD+EUfCLFGiMBjXTiv0CILfl65h0h+jeL4Hb5XdsiA5RYxSFEQvm7eb1r
 uVGrdyc8XiQwPhdFSPjyFvJFgp3b6cuqOmzGxuS677vSoorwUMu9vivF+Ub7gwthaAhN
 WSuN1lcUbLMFyoIA/ognZdc05xGFLY/Tri491T0498sS4tLRjxBgU+KUuRPUXZlO2Qzp
 Ev9q+Ynxx+aGmWbEz/mLfBPSZi727CMKIF+TYPetzLCMoBF7pNhCkelWY2R33OwqRAu7
 iUs8WqMQxlt8yJfjuCAX/GxEVcaXiYzVyYt6IlH6XTByUwuVuhf26aZknuWIC4cEWD2t
 qkEA==
X-Gm-Message-State: AJIora+dzA14za952FDCEwc6ad1EFEnsFxGJJKhWE88XNyyWjNHgzYoL
 IP+YUSPFsZzWFnXdeZrRCiU=
X-Google-Smtp-Source: AGRyM1sCkd5S/jt09piNzi7q9MfexTaswI/jnjkkf3cAzCIkJ1Bjvc8qlvH33/wk3R19OOyJ9B6X+w==
X-Received: by 2002:a05:6000:184b:b0:219:bee5:6b75 with SMTP id
 c11-20020a056000184b00b00219bee56b75mr9159224wri.80.1655290933785; 
 Wed, 15 Jun 2022 04:02:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 k19-20020a05600c0b5300b0039754d1d327sm1984457wmr.13.2022.06.15.04.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 04:02:13 -0700 (PDT)
Message-ID: <4d501ec8-836c-9d33-65a0-4a6ab943091b@redhat.com>
Date: Wed, 15 Jun 2022 13:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 0/4] cutils: Introduce bundle mechanism
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220614210746.78911-1-akihiko.odaki@gmail.com>
 <YqmYrFjshfAopt3A@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YqmYrFjshfAopt3A@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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

On 6/15/22 10:30, Daniel P. Berrangé wrote:
> I don't think this is an attractive approach to the problem,
> because it results in us adding a bunch of meson rules to
> simulate 'make install' within the build dir. This is undesirable
> clutter IMHO, and can be solved more simply by just modifying the
> qemu_find_file() method.
> 
> The core problem is the impl of qemu_find_file is taking the wrong
> approach, in several ways, but mostly because of its use of a single
> 'data_dirs' array for all types of file. This is bad because it
> has the assumption that build dir and install dir layouts match,
> and second because when we add extra firmware data dirs, we don't
> want this used for non-firmware files.
> 
> We need to separate out the handling of different types of resources
> for this to work correctly.

In some sense this is what Akihiko did - instead of separating them in 
qemu_find_file(), the "pre-install" layout separates them in the 
filesystem.  While I had remarks on the implementation I think it's a 
sensible approach.

The pre-install directory could even be created as a custom_target, 
using the JSON files from Meson introspection.

Paolo

