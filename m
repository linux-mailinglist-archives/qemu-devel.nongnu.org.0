Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0296F5CAD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:06:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puFvg-00068C-BH; Wed, 03 May 2023 13:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puFvd-000624-T7
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puFvc-0002of-82
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683133567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J+rjya1IxEy6TowkQRkdsrRfLfYqkX5NeKS1vxwF+fA=;
 b=VFMYaGws3BxUkHQiUy/+2wp4o0sQaHG0Kj3teKQ8eMglCCVeYbENVdR7y5HAI17kLoP5Kb
 /vW6gt/kit8HxJ8bdqC6llkVfbeTboQlkYQeqYNqoXEoTpUMOfnP1nqwMtjcjBo1SORajI
 zunNkIZP9Gd2WJMS7gUcJE1VyG2hNSE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-Bj2SvQVjOnKrEqSth57-Zg-1; Wed, 03 May 2023 13:06:03 -0400
X-MC-Unique: Bj2SvQVjOnKrEqSth57-Zg-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94a35b0d4ceso538990766b.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683133562; x=1685725562;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J+rjya1IxEy6TowkQRkdsrRfLfYqkX5NeKS1vxwF+fA=;
 b=ilzCF0zTCgLjEBH00yfmEJwSAkLbG5nffaoE3quwT9NIpeEabzjoLgxCvygTckLw6c
 MHObXGGe7lMraA8vDwPBWOOgwm2EGd39ltPkH3x1mbap1haW6/DG/i9gY+xELnPu85me
 KS0CdFwzVBul+BI9sONaOln9j5JOEa3SG6cJjBUP0D+MpO6nKITtiBj4XXHzVLsplP7v
 hYxh8RDRxwgb7hzM+JkIq3psiD0pV5Af/HnBQkti+qDTv0bbchyYJlu6zfX/WG6T33uP
 YBFQ/S5XVnc88hY9nDqoYqZf74khj8+rX7cKgsQTTgpn8ZBsJJ8+c/AS29zwcB8i2Q3b
 1CFQ==
X-Gm-Message-State: AC+VfDzh39vykUlam+LkEhGycY2+rCenxUaJqMC8igUKSvrAPEe5ao1J
 l9986oCEzqy+9xGfyA0cdbRLf8x+I9B+F0GjDRAGjE7IMzKhKMQJ3WdUJo6TXBLHQ9YCVAsWzQ3
 dJk31JFrd98hoJMo=
X-Received: by 2002:a17:906:9755:b0:878:711d:9310 with SMTP id
 o21-20020a170906975500b00878711d9310mr4437538ejy.1.1683133562379; 
 Wed, 03 May 2023 10:06:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47N0q1hSDpHcFR3hi24d/RmsdobE8PeqV1Ynln570VRtecoURoojcLr2fx/PKmx3YfDeFqiw==
X-Received: by 2002:a17:906:9755:b0:878:711d:9310 with SMTP id
 o21-20020a170906975500b00878711d9310mr4437499ejy.1.1683133562024; 
 Wed, 03 May 2023 10:06:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 a13-20020a1709066d4d00b0094a9b9c4979sm17427239ejt.88.2023.05.03.10.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:06:01 -0700 (PDT)
Message-ID: <5fb214d8-4a54-f896-f23f-fe9e646e4b2d@redhat.com>
Date: Wed, 3 May 2023 19:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
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
 <20230503091244.1450613-6-alex.bennee@linaro.org>
 <531a2eab-f0e6-46a5-c021-c82746c1ae38@redhat.com> <87y1m5s9yl.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87y1m5s9yl.fsf@linaro.org>
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

On 5/3/23 17:35, Alex Bennée wrote:
>> You should select a device only if you cannot even start
>> the machine without --nodefaults.
>
> Which is the case here right? We could skip tests that explicitly
> instantiate a device but these are tests failing with default devices
> the machine tries to instantiate.

I'm sorry, I meant "select" directives are needed if you cannot even 
start the machine *with* --nodefaults.

Devices that are added *without* --nodefaults should use "imply" 
directives instead, as is already the case.

Paolo


