Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE956F5CCA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:14:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puG33-0002sj-PY; Wed, 03 May 2023 13:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG2v-0002lo-MV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:13:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG2u-0007jY-72
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dvsmRfcyMA2IRZZSI8Bptlq0LVXzOgNstthrWbyr6ok=;
 b=FUIPjNs9n/zAQFM/OwIkXYk3GlXNvFgw0gtn6jW/pIbkcY9vwkUYG5Sh346LalLPUVianl
 Rd4hw+4MqS98iDS00/kO/Wt61kwcsjr8o1AspyE8LWjwF+WEs6WpwrNIdvYx3l0ZezfQIY
 gHSkZ77+evJ/N0LadDQRfFmNgzM6E5U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-87ac0DwiNuW6hL_4LXiawQ-1; Wed, 03 May 2023 13:13:37 -0400
X-MC-Unique: 87ac0DwiNuW6hL_4LXiawQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a34a0b75eso489604266b.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134016; x=1685726016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dvsmRfcyMA2IRZZSI8Bptlq0LVXzOgNstthrWbyr6ok=;
 b=J7/ml56/fXegYJvv+iGdGOrn2q8CUKLAvnHoJn3wu9b/yxif4XbpyPIMT63o84PYcS
 +o68YAJxb0IJz+gGvcY17EmgG6TvFESbLGMbw+W8g562SEjcQgVe3+ZuZ3vmuvPfBR+V
 bTN7Fb6yyshAs5FEESinblb6Yt4SYrWxRK3pGABK3ZIUv50N3Lv7ICGy9tRDkMEsgumL
 GfytFm+1OBlHu7R1hOqB1sHQ4qel062YWa/aXjdS5zLRVmmTzj8Nd1SO5/smwqUZL8Og
 5WdFU0dsE+DUj61Oan9diYc4jPvTx7cjET34vKY/oQpwDTGOc0KFsT/fois/OKiHafvF
 7Z9g==
X-Gm-Message-State: AC+VfDxINB9vz8XfA2Th2FuuBuJFXqFcEkjfu5djdBHj0toS2dgeBhQC
 OE2Bv3IQB/KoY1BhlIsZ+Cw7g3UNK/Qm840G8BEs/+WijjE48tNm+hpvqNkDA/dh3BP5jdVUeqf
 jyROs+Zkb35jscX4=
X-Received: by 2002:a17:907:9415:b0:94e:f969:fb3e with SMTP id
 dk21-20020a170907941500b0094ef969fb3emr3888248ejc.43.1683134016387; 
 Wed, 03 May 2023 10:13:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7teFZFtlzQrmVuRfP7A5t7isv70YrsoQG/LHh08sfOO89aAGTSNv/WntFYQNDuGz5Q9wOMZA==
X-Received: by 2002:a17:907:9415:b0:94e:f969:fb3e with SMTP id
 dk21-20020a170907941500b0094ef969fb3emr3888215ejc.43.1683134015892; 
 Wed, 03 May 2023 10:13:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 vc14-20020a170907d08e00b00959c07bdbc8sm12679708ejc.100.2023.05.03.10.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:13:35 -0700 (PDT)
Message-ID: <06639be1-8986-9234-a44c-4630dbe378a4@redhat.com>
Date: Wed, 3 May 2023 19:13:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 09/22] hw/arm: Select e1000e for sbsa-ref machine
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-10-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> From: Fabiano Rosas <farosas@suse.de>
> 
> This machine explicitly selects the e1000e network adapter if no other
> option was given in the command line. Make sure e1000e is present in
> the build.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20230208192654.8854-10-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

This is not necessary, and patch 10 is not as well, because neither VGA 
nor a NIC are added with --nodefaults.

Paolo



