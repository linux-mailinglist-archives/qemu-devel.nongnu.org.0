Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1D76F5516
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:44:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu91n-0005Qv-Id; Wed, 03 May 2023 05:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu91l-0005Q1-VL
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:44:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu91k-0001nZ-Cz
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683107038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxOXh6c98oGKCIaqyo+cLYg2LNcki+YVv44cF0AJywM=;
 b=Qj3idSdCBQrlyyLj1IUqFaUk+ZrMKkJK25vXGqV5jCiY2GtMZQ7xpNdkyYoNNfHd4JCkHL
 IiOcpS1SSSuvizxtr2ClsI1E5xScA+NW+tVv8pfG4xNhuEc02VZAU5r/+JdWCaV8eLOl8Z
 xZNkFi0zSlH+/A0Kt6e7obpHj+Uyw1c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-536cy-UdOWK5SG2mlf9I2Q-1; Wed, 03 May 2023 05:43:57 -0400
X-MC-Unique: 536cy-UdOWK5SG2mlf9I2Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f315735edeso10563665e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683107036; x=1685699036;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wxOXh6c98oGKCIaqyo+cLYg2LNcki+YVv44cF0AJywM=;
 b=gJKD9Pyr9jAeS7mZUj2IYFb7r7HAdG+WRayBifPD5Ag2HGhPmRD4VIyT/lZuNI0mgQ
 h9ghwAh8F3VN5mBuoOI83bCUYvqip7oivwAmUjSUich/WFh/LvU0mna1Npd7qUMNMNA4
 9bIiXZFjaQMUj9eaceVz+4aEN5qfeYyQBbeLxun1KUVupnwpXN3x/RJ1cgxIxSEzSsjR
 jXnkUP9JUf8GyfPfef1u8hkw/uzibWyd5uLDl93K5x8BkIwelQwg/Llw2r5f+UjiTqZj
 M75diP/QEqunkASV6wm8o+8wsZUAbOn/GSSe5e3+sxd9f9gb6FSmpr5556vSTiJmx+Kj
 h0Iw==
X-Gm-Message-State: AC+VfDzP2OdVHp0mrQ696+RFEoqSIA7k/aCkrnmpS30VsRThRcAt05VX
 djuxR9wbp+r9JrBFkqWRF+k3ES6FPkC7XAJtW5GwTztHikUApQOhDoZk/G7whEdvn72JyJswPn2
 zhblVmmDvqFmtxTM=
X-Received: by 2002:a5d:4846:0:b0:306:403b:455a with SMTP id
 n6-20020a5d4846000000b00306403b455amr1074486wrs.27.1683107036131; 
 Wed, 03 May 2023 02:43:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5U08ekfI0A/J1EebK9M1hjflwu9Og4CZfyCCgRQVNquIY+kCyQ23VcP5Q8iYVTSqQkFJ9Fpg==
X-Received: by 2002:a5d:4846:0:b0:306:403b:455a with SMTP id
 n6-20020a5d4846000000b00306403b455amr1074458wrs.27.1683107035877; 
 Wed, 03 May 2023 02:43:55 -0700 (PDT)
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d684a000000b003063176ef0dsm6275273wrw.97.2023.05.03.02.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:43:55 -0700 (PDT)
Message-ID: <2428e066-f8f0-eab7-40d6-3332dcedce6a@redhat.com>
Date: Wed, 3 May 2023 11:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 21/22] tests/avocado: use http for mipsdistros.mips.com
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
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
 <20230503091244.1450613-22-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503091244.1450613-22-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/05/2023 11.12, Alex Bennée wrote:
> As the cached assets have fallen out of our cache new attempts to
> fetch these binaries fail hard due to certificate expirty. It's hard

s/expirty/expiry/

With that typo fixed:

Reviewed-by: Thomas Huth <thuth@redhat.com>


