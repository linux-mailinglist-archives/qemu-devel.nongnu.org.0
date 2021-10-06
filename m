Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE77742384B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 08:41:55 +0200 (CEST)
Received: from localhost ([::1]:52176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY0ck-0001D5-Rt
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 02:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mY0aW-0000MP-ON
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 02:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mY0aU-0000L5-CV
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 02:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633502373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5eAUsBTKiEprZ1IdKP52iZJvsgidSYmJZ7sG4PxK0x0=;
 b=Hwsczoljt/+SmbxZajUfaY2n1vOXhg3C2aUY2TY0QHtXT6Y9mMTaWaXwAiXpwZwTs6Qr16
 ezNtHYeAwob++7n1Fci9ImVp89RHQ0OGi1I8RpIaeWBjg6Nfw/4ReHX4/UH+tPbtFlx4yy
 Tp9HFfMPGcvBfTfVKTlOLLZkI+eCUso=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-55L1oQxENOiGlnLAdSip5g-1; Wed, 06 Oct 2021 02:39:30 -0400
X-MC-Unique: 55L1oQxENOiGlnLAdSip5g-1
Received: by mail-wr1-f69.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso1162869wrr.15
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 23:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5eAUsBTKiEprZ1IdKP52iZJvsgidSYmJZ7sG4PxK0x0=;
 b=pJuYSR4iD/i7XiqaA/Ql20zoCf0seECB1fqmeRfXAx6ZTvnWmyPUpGgFX13SYV5QJO
 /hjkfcA1oEHiqNClvWbEBW8oNspX2Y/VyNEvtVv4to7sCXys9Rhhu/st+qqKpALvlGRq
 9zGCYnnuj+vYuJUjIdlDOqlceFhz8AY7fEWoloR+5fjx7hdwjsan3Sb5Op8g5/vE8yOe
 gVIzJRd+pJoyfmzJqCdA/NjXbFDg/0JJZp4OpExfb8qZ04V8gSGqNvg2wAEN9IpsvAdV
 /t8d8qOCdo6/zZKFs9Ykgtr34Ik2a4Y45mePfgjWLYD/vqQKarqfr68g8/xzmVLM4p3i
 4iKA==
X-Gm-Message-State: AOAM533Hf0tHf2Z9SEfO1dxICffu0M4juwRa4hHhHqGy+vSQcMztJHYK
 6BKYiU2xAexzRX4cGeN6ltf1I7wTj70Do8i1Y/G8N+kZEueKBHUQ+NKsoVYMm667tdAgvVlzT2l
 jeKqznolOP/4+dVQ=
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr3220568wmc.90.1633502369754;
 Tue, 05 Oct 2021 23:39:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxid3I9npv8an8Gam/ITmo+ghJVrle5E6ySXF5ZLuOXrk8FgnKX+l51vtUeMbAwKZ/AYWGgOg==
X-Received: by 2002:a1c:6a07:: with SMTP id f7mr3220536wmc.90.1633502369520;
 Tue, 05 Oct 2021 23:39:29 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id u17sm5663642wrw.85.2021.10.05.23.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 23:39:29 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU?
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e1aad2c6-02d6-b8c5-950a-f2f6eb76939a@redhat.com>
Date: Wed, 6 Oct 2021 08:39:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/2021 23.53, BALATON Zoltan wrote:
[...]
> Maybe these 405 boards in QEMU ran with modified firmware where the memory 
> detection was patched out
I guess you're right - the code also expects a file called ppc405_rom.bin, 
and not u-boot.bin, so this board was likely used with a completely 
different firmware (which is not available anymore), not with u-boot...

  Thomas


