Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583806F5CD4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:16:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puG57-0006pS-HO; Wed, 03 May 2023 13:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG55-0006ln-Ql
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:15:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG53-0003Rf-Ot
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:15:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tyDTZ6eEK5JlfyVWgV2p0R15jFFMMHvTlxtliUVQq14=;
 b=I9p8iCa4HlGdZkhPZQalEEEFYFhDf93+UiK7W7pdQV+tZLxeRM7XkxDDfKna2Q3B9oO9OL
 Sidxs/Tod9t5+/+cn/xipRhZoy6U4OAN7QynEhaWEu3EHQYKJb2T9plsbjs0WtNE+bEcGr
 lgZa7oov0glKjXITzFLqqDn/7fGWUD0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-oEu1L9CAOMuoHjPPRhdI-w-1; Wed, 03 May 2023 13:15:52 -0400
X-MC-Unique: oEu1L9CAOMuoHjPPRhdI-w-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9576a365957so674678466b.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134150; x=1685726150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tyDTZ6eEK5JlfyVWgV2p0R15jFFMMHvTlxtliUVQq14=;
 b=OsaG2mdL6zn3RWu+UB0usw+QQfyizBK4Wsy2Yr+TRJw9rxKwXHLM3YFz1zJK/koBXw
 x61bIvO2pr5EDSmKlAcYJa6Zg2W2jPyEXMygpoLeliPvRQiHab0bmzFYCKU8jNmLsOHJ
 s7M37LPGPsMDtSbShpjts9xksMFcYsi3eujwfGncRUp+6U+lh5nqAhkFgVNzqdVYYQi2
 ExJZAL8EWrzTndNaYK+LlLzuS2U+n0o//xXvtuNQBWARRdFiGxZVo0sVPS7HLXnkTUvr
 L7nuIZHzrSrdSa/eM96jF+qJeNKU1WDMUKNAAwJIS1rBPWEJttzjTJClG44FiEw2OXtt
 KHwA==
X-Gm-Message-State: AC+VfDxgWY0gzn8WxIxEmMCJaDC8Pok0RqbVEdN5c0l1NgS29fTtu9ju
 AMnGEloE7lWBel3ZP6u3n41Bz6FsGbquJJwsIAvhgNI+KW09xBpowWhqgYX5aYV4QCRNd53e5W5
 E1fwFSeY2aTSXM8oRt/dEWPE=
X-Received: by 2002:a17:906:db0d:b0:94a:6f1d:54df with SMTP id
 xj13-20020a170906db0d00b0094a6f1d54dfmr4037393ejb.67.1683134150239; 
 Wed, 03 May 2023 10:15:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Kf0rttn1eakCBVr3gEQ+fQEaiTZdcc74BaIUkdc6ZEdqw/vUDmYI3ISpdWFczViPo8BmJ3Q==
X-Received: by 2002:a17:906:db0d:b0:94a:6f1d:54df with SMTP id
 xj13-20020a170906db0d00b0094a6f1d54dfmr4037352ejb.67.1683134149840; 
 Wed, 03 May 2023 10:15:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 gn2-20020a1709070d0200b009545230e682sm17367686ejc.91.2023.05.03.10.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:15:49 -0700 (PDT)
Message-ID: <37f6e22c-433e-f71e-e348-27a23f35c116@redhat.com>
Date: Wed, 3 May 2023 19:15:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 12/22] hw/hppa: add TULIP as a dependency for HPPA_B160L
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-13-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 11:12, Alex Bennée wrote:
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Not needed.  Selecting "LSI_SCSI_PCI" however is correct:

bus: main-system-bus
   type System
   dev: ps2-mouse, id ""
   dev: ps2-kbd, id ""
   dev: lasips2, id ""
   dev: fw_cfg_mem, id ""
   dev: serial-mm, id ""
   dev: isabus-bridge, id ""
   dev: dino-pcihost, id ""
     bus: pci
       type PCI
       dev: lsi53c895a, id ""
   dev: lasi-chip, id ""


Paolo


