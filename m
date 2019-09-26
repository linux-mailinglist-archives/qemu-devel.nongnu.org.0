Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24B7BEBEB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 08:23:08 +0200 (CEST)
Received: from localhost ([::1]:59644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDNBC-0002Wx-Nv
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 02:23:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43943)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iDNAI-000261-3p
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 02:22:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iDNAE-0000Kj-C6
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 02:22:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40140)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iDNAE-0000EQ-6P
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 02:22:06 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C86CC796E9
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 06:22:03 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id r21so558535wme.5
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 23:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:openpgp:cc:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=cUeewzB64b/YHQPh9C2MfAs+Yag7+Szy4ODmoiK86xc=;
 b=AvQYHyLRGbzstsWXbFJq+5BvGTyDpCUgZRWfq4hob6CES2WetTWOvZUcNZkZo5HKAR
 6TBOJvbUiuj6ibBacfZWnTIUpcstZfFLni3YfBFKeBs97mHx4ODq4aHZbGIl1JoISU7f
 Vy9zssXQnbQeR2yhbFA3Zc5Ar3Gq9OhpIV5HiMTGK2PfRBTd8M/XeWXYKj4511abvfvm
 EUiaQDPJgULWnuSut5N4A4DnKMQwH8SQOUcmVpBk/oZ9KVkDRxIN9GYi/vOg6HTUQGOi
 JJ3Aq4m4mXzGiZk9EUkVKJVZIRd0MVEKl+JiU+npL+Ga5b/GVdassFkBCwymXK6QJoF9
 AFaQ==
X-Gm-Message-State: APjAAAUreTZbZHp6X7ry8Nf1QOWBnVeN60u/b4WOuUqnQQL9DoLOZbnG
 ZJ9Ax7vcni7zWUauappYBQZNKeyh0wJE25GXnLniwAGaPxqBNcot1XII2GYpQDhGMJwNwv202fi
 3cRP8v9yvnK07bs4=
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr1534402wrr.334.1569478922520; 
 Wed, 25 Sep 2019 23:22:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwksJtzeoOcDz5vYrj8CdZcENoTxKd16QJs96EiCesZbGvulDOcSZmT5HY5kONvOjcSpQfVTw==
X-Received: by 2002:adf:ff8a:: with SMTP id j10mr1534382wrr.334.1569478922288; 
 Wed, 25 Sep 2019 23:22:02 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id r13sm2689233wrn.0.2019.09.25.23.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2019 23:22:01 -0700 (PDT)
To: QEMU Developers <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 David Hildenbrand <david@redhat.com>, Xu Wang <gesaint@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Subject: hw/s390x: why watchdog device diag288 is resetted twice?
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <a52656b8-3b99-fb9e-f554-fbd988f62d87@redhat.com>
Date: Thu, 26 Sep 2019 08:22:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

hw/watchdog/wdt_diag288.c use 2 different resets:

1/ registered handler:

    qemu_register_reset(diag288_reset, diag288);

2/ DeviceClass reset:

    dc->reset = wdt_diag288_reset;

diag288_reset() simply calls wdt_diag288_reset():

static void wdt_diag288_reset(DeviceState *dev)
{
    DIAG288State *diag288 = DIAG288(dev);

    diag288->enabled = false;
    timer_del(diag288->timer);
}

static void diag288_reset(void *opaque)
{
    DeviceState *diag288 = opaque;

    wdt_diag288_reset(diag288);
}

Why do we need this distinction?
Is this some special corner case?
Isn't this device connected to the QOM bus?

Thanks,

Phil.

