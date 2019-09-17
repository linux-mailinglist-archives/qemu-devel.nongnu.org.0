Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C77DB4C5F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Sep 2019 12:57:49 +0200 (CEST)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iABB6-0006qF-7R
	for lists+qemu-devel@lfdr.de; Tue, 17 Sep 2019 06:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iAAyv-0003ax-8u
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:45:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iAAyu-0002vJ-4n
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:45:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48106
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iAAyu-0002v1-0t
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 06:45:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1568717111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=ZXnAAwDpoRm+8ePiNphj3+hz3hw4EQKkVK9lF56zImE=;
 b=XRKg51eQsp5pqJEih2OuOx+qmJIIpmYfIydsvlX3OHuf1x9BO26VLkyOSF5ec6j+6a9/mc
 m/ph1huhp/DPKiowqz/abdq+Nq7mDwQZ77ZLgeZPGYwsynhV7yyYcR2o9NRPcg5qw8kGUP
 llqxYghig1VpIEezfWT6FINJS758jBY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-mfqKgyd7Pua3-Mgel-flBg-1; Tue, 17 Sep 2019 06:45:10 -0400
Received: by mail-wr1-f69.google.com with SMTP id t11so1152094wrq.19
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 03:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MBl5Gw9CvcQqiym5eHRZo9rFz9hJ4bHK2/YeC61tE9w=;
 b=lHNitj2G3Lhs0HmpPEiSnxMpfV9RMOukI8g1/74stEiI01Nte8ZEQZZ3b83kBbGVfw
 LxlT03qEEqLFRtXBK6YcVXt5+gy/aHAYrtXMlBpBzA52PGpmbONDx4OMYqvSF0Co8aj0
 hy/GoN3sspOuyK30yUxxHvYwyQHYmcGkZtfxMhOyAOuAuVWPyMu/U/sX5+uD8qtdjlnj
 x/GGRQ1vCew8q9GRXSvSlAz/M1wl+U6Ik7SK7VK2nnXFjcI11Ucj41p7omiOQP8mNUlH
 KSfE3oKTIDNxUrNqt6q0Gsu3QI31Ek2o1aamfqEXqgFM07sV4/uAIbaAZ2dpMht1DaT3
 STRg==
X-Gm-Message-State: APjAAAXh/wTCspOM0yJhrNEuMWnTRwVjUlRS0ueHeuq085/xod3UOjAj
 3H35B1R0eId9YxlMsKVuGErrI9sQq53LHoSBBh19Akue7jxRwqBwgi5Tupe4OWwZba9qH+D0Bop
 ZtQFeE0Ciq6CimNg=
X-Received: by 2002:a5d:6701:: with SMTP id o1mr2459340wru.6.1568717108606;
 Tue, 17 Sep 2019 03:45:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3i8Ci3p8Hn/xtuyHdnviJVKbESegfW6XDJjzLqn6L+OTzVNXL+rOIWOwYPlIOq0URxZju8w==
X-Received: by 2002:a5d:6701:: with SMTP id o1mr2459329wru.6.1568717108355;
 Tue, 17 Sep 2019 03:45:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c46c:2acb:d8d2:21d8?
 ([2001:b07:6468:f312:c46c:2acb:d8d2:21d8])
 by smtp.gmail.com with ESMTPSA id p85sm4971260wme.23.2019.09.17.03.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Sep 2019 03:45:07 -0700 (PDT)
To: Yury Kotov <yury-kotov@yandex-team.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1568646858-17065-1-git-send-email-pbonzini@redhat.com>
 <1330281568711811@sas1-fc7737ec834f.qloud-c.yandex.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5c5d623e-55c6-9264-a72d-d3730328662d@redhat.com>
Date: Tue, 17 Sep 2019 12:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1330281568711811@sas1-fc7737ec834f.qloud-c.yandex.net>
Content-Language: en-US
X-MC-Unique: mfqKgyd7Pua3-Mgel-flBg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
Subject: Re: [Qemu-devel] [PULL v2 00/29] Misc patches for 2019-09-16
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/09/19 11:17, Yury Kotov wrote:
> Sorry, it looks like that you've missed the 3rd patch in the
> "High downtime with 95+ throttle pct" series:
>     tests/migration: Add a test for auto converge
>=20
> Or was there a reason for not adding it to PR?

No, I just missed it.  I will add it to the next pull request.

Paolo


