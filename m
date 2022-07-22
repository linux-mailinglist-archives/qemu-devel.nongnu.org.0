Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB1F57DA1C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 08:13:45 +0200 (CEST)
Received: from localhost ([::1]:50608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oElux-0001f9-NE
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 02:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oElrn-0000DI-75
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 02:10:28 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oElrj-0008NW-Ir
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 02:10:26 -0400
Received: by mail-wr1-x436.google.com with SMTP id h8so5116007wrw.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 23:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ikmiciVfjiY2xNehLzeLdIeUY3MGYdc4csVlPEPiZL0=;
 b=L3JTkVgm+qqcs+lWaydOwXywIV4JNGRCJ2L3yWuwKeD4okeI84+WaZ0K76v8PR0PbV
 TapmdkghBeZ2QBVBv4fgRPerporkW5kGRuPkxRSmp02Mxez6O5fxMGCTCjerCizHY0Tw
 Hl8gyLAHAamnw+xFtO47N7Ps/LTSAee3Ay7JMlqI9JqDg2f8gIukT+SfaaU94DxXFad5
 iVBzVKeq2aYj6UmLrSDfy1kgDekimOyxprhblje6ewMvig9/MXiBQkPNgejTQ+KDR1ho
 3jKvtN2LkwvP3KgEHODi8VL79C3RUkSfBe3JeozDVCV/3L8Bq7OJBOGf16wDHJvk8FAd
 EgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ikmiciVfjiY2xNehLzeLdIeUY3MGYdc4csVlPEPiZL0=;
 b=Hi9gSr0h9BlloshyDMJqqmpwuwbfd0b2Ig54KjgkNQmyDMu+iyxlgE86fp1Ub6iiDV
 Sh/vGK+lkvBUr1yy5sh4kk4fsmNZQbvXfLkYC4oR/5gS4WKJ+f61lP6W0vxyOLZjH3QH
 tEt9oDiB7uANxFexRzhv2Fikrd6tp5aJRXa4bIhtkKhrVqpN2Msus90jYGSa7CMBOEdL
 D+4xlZ/1XZVDF+LlRe+LNxOjWtUD1Xwc/lygK0X5N7kH9KrS0HQKF8wzvQtEP+cKH7dG
 ULBCPndLjtfOmZkAKRw+x10DN2N3+t2Fo11bdOdp1BTo9tKmXym0vcpCmV54bhfMNR0G
 QZ1A==
X-Gm-Message-State: AJIora+baGnkig3tooPif+79J4DsWbZrpOILmDIcHPjK7qAO45rW/N1k
 KBBcZjTOEB+FC9w1zzBderE=
X-Google-Smtp-Source: AGRyM1tXoNwCnKLYCje842Qfs+zNHdWwnlG0EBV4R+ysyDGz+GRL9fYcjfVzvF49HcHe3t82bDKDbQ==
X-Received: by 2002:a5d:64ce:0:b0:21e:5064:a529 with SMTP id
 f14-20020a5d64ce000000b0021e5064a529mr1251498wri.213.1658470216184; 
 Thu, 21 Jul 2022 23:10:16 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 h13-20020a05600016cd00b0021e4e9f6450sm3622693wrf.84.2022.07.21.23.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 23:10:15 -0700 (PDT)
Message-ID: <e8335022-55a6-c0c4-75be-df1d2a419c4a@redhat.com>
Date: Fri, 22 Jul 2022 08:10:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7] hw/i386: pass RNG seed via setup_data entry
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <CAHmME9r8F4-ji6--PikVzSjT-rPiwqkUrK0rBtxtbYNnr8x0Lw@mail.gmail.com>
 <20220721125636.446842-1-Jason@zx2c4.com>
 <50f168a6-1351-dd5d-67f0-e222f9547071@redhat.com>
 <CAHmME9rOHHy94-yajn2vTs-cBHUq2w=Zds8GAqK-XobWYRCayQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAHmME9rOHHy94-yajn2vTs-cBHUq2w=Zds8GAqK-XobWYRCayQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
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

On 7/21/22 15:04, Jason A. Donenfeld wrote:
>> LGTM.
> Thanks for the Ack. Do you want to pick this up or will Michael?

I was waiting to check if Michael would reply, but I've since sent out 
the pull request so I included this one as well.

> Also, I assume this now is the working patch, rather than your 4
> parter that potentially bifurcates this discussion?

I will rebase my own patches and send after 7.1.  You're all set.

Paolo

