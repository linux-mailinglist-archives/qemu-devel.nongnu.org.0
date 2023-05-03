Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3B36F5CCE
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:15:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puG3t-00042H-1E; Wed, 03 May 2023 13:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG3q-0003qm-Df
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:14:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG3p-0001EK-12
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:14:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KPuxb7t6Ub9IyBGCCTrrWQdZ9JCBR7dViJZoYif4jtk=;
 b=WQwytQkUD2DKFaGm0/B7gxGFXSxgYZBdK7BZLOFhKmrSZHgmZidWRJ9DW3nhujHOgNKNgJ
 fK1MA55Q2Bh/WECH7bWehOz/WX8Zp51cCgYF7eTadNoeBMDe9bbgbQCAfas7NTBReyxVc2
 Onmz+VsQSibsmWPztz5o+5NRS6f/HKU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-0YXDxfAtMG-K9tOpctKjRw-1; Wed, 03 May 2023 13:14:25 -0400
X-MC-Unique: 0YXDxfAtMG-K9tOpctKjRw-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50bcaec14c2so851019a12.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134064; x=1685726064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KPuxb7t6Ub9IyBGCCTrrWQdZ9JCBR7dViJZoYif4jtk=;
 b=Zj7Ip2jXk5yTKMNhvqCM4Y/8aHue03BSjwqoZr7RIEYl4jUjtEj9XaioXfdLJgOz/q
 64SzCrfKJqGnLOf2QnrQWRaB0bZasFVPxtBPOpUb3DaJLXKZ+tAj/7zMhUf5Uik9yMm6
 7avM5J1JxJ/+CuXQo39Onjpq1OClDi4wXYg8ZBBkbeM9ZE6Ie9Vky2SqW4pBRI8M0doD
 CeTQF2IbvAKHbAUJRXBT+4wxGERfipP5Bov2jMDW78vT9TnOXt3hva9czqyiRnieboVU
 +9uiJApNqTflsvDhDYzHZBG2VA7u24LMgWetGCsn1EJF+MG/ikg3d74/50nSv0ZHpSuN
 b5mQ==
X-Gm-Message-State: AC+VfDxfBVt/j6A+Pn3OxoIqlpO2ig+Ld+r4JFqoN9P5sgU/AHPJ6x6w
 OLNTQb/ixzgt3vh/1Ugm3RSgZ0Y8gTMy8dbt7pvKIA9xooQmB4bK+uEv7vm60rRM6/J5elpbc2w
 o8BVGfDlFhxTu8fE=
X-Received: by 2002:a05:6402:8c5:b0:50b:c013:f933 with SMTP id
 d5-20020a05640208c500b0050bc013f933mr2437134edz.6.1683134064464; 
 Wed, 03 May 2023 10:14:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7KPLFrZR11HuEdkeX14yL0nLRpMQ57rQxGkx5DXbFGpBHnvzQzsHLOTGFugWPXsf/7QiLYVw==
X-Received: by 2002:a05:6402:8c5:b0:50b:c013:f933 with SMTP id
 d5-20020a05640208c500b0050bc013f933mr2437105edz.6.1683134064152; 
 Wed, 03 May 2023 10:14:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 f22-20020a056402069600b0050bd4b8ca8fsm901134edy.14.2023.05.03.10.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:14:23 -0700 (PDT)
Message-ID: <e0b66013-be38-f580-c3b5-7e793ca1f8cc@redhat.com>
Date: Wed, 3 May 2023 19:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 11/22] hw/alpha: make E1000_PCI a hard dependency for
 clipper
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
 <20230503091244.1450613-12-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-12-alex.bennee@linaro.org>
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
> We can't just imply it as the board will fail to create otherwise.
> This shows up as a "make check" failure with a
> --without-default-devices build.

Not needed and a test bug.

Paolo


