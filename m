Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C669E10455C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Nov 2019 21:50:59 +0100 (CET)
Received: from localhost ([::1]:34404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXWwE-0004xV-Mt
	for lists+qemu-devel@lfdr.de; Wed, 20 Nov 2019 15:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iXWv2-0004QM-Bc
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iXWuz-0007GD-BH
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:49:42 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:33403
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iXWuy-0007FQ-T8
 for qemu-devel@nongnu.org; Wed, 20 Nov 2019 15:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574282979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=HRis5i6yYHKS/dxshNht72DbzHx3IppYQjIM5D9hygI=;
 b=HcV+Qrb4m5n9BMcWlVmKW5jFWBPcyU9B2ltvGBvAxCYK+PuVelyOhXU90kqUlxnXRWeYkR
 fMkV5EthVeGHFj8+2tWPi70PVozGr/9kARIUpS3ggbP48DLhXofJizXY7aWM5w28gDg90/
 DH0QUR50zn0tn+AjjDt6tqPwu4ROFx0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-0zxg52C3OmWyCVtJjDXGkQ-1; Wed, 20 Nov 2019 15:49:38 -0500
Received: by mail-wm1-f72.google.com with SMTP id t203so552124wmt.7
 for <qemu-devel@nongnu.org>; Wed, 20 Nov 2019 12:49:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CVNW5Bp97vkVjfYbsDGYSC0GGjzqEpgZp+tDj3PYkc8=;
 b=iINIzO8nUqeSLH2pl2KkghezrDA0++XdWbTcHA20XgUifBMLHSRsiE7xeh/x4pPloz
 KFKIxWn6D4qZgtpweVYUs0GRiOzP7oSj7DN3iS3r1BbOqRDgirMHZZpTl35X6o18vjy4
 n4ABU395FMvUA35VV4XJdC5/3RUvA95T7HDbaI1IBFXvjdSRT+uF4tx6ISBi5ZxZJiy9
 9kra4zRH93a2r+wsKrEClYvl3E5as2WiJLz09GfVopKvsUpOmHk7etvyIVLyi+milrFJ
 l/JHIwEUkLXh7hnp6OA8+texip+XH8La/r+gjAb3i8LBrTAjTBmk6FqoqlN67LxkAJzF
 1Mbw==
X-Gm-Message-State: APjAAAVHwtldDLdBa1Ke9cDD4awBeRD/9rDR7WxrFt91HqnKGp7Xxden
 gXXDzq0s/5ZCdntG4SAvjSkhqPUvcipmXF9N2EhH5o4+1miQZSHaNyXquJWVRoUM8Zf6hbe1ETM
 IwdSQ8s3xF+W3yhk=
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr5854367wma.38.1574282977068; 
 Wed, 20 Nov 2019 12:49:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqyLhF7OsA1LsdtCVtkIst5Ujl2VhhIp3t7t6znIKakR9kIoWjAAngMgaAaebOLuADQVkB1Vnw==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr5854317wma.38.1574282976679; 
 Wed, 20 Nov 2019 12:49:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:dc24:9a59:da87:5724?
 ([2001:b07:6468:f312:dc24:9a59:da87:5724])
 by smtp.gmail.com with ESMTPSA id 189sm541664wme.28.2019.11.20.12.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2019 12:49:36 -0800 (PST)
Subject: Re: [PATCH] target/i386: add VMX features to named CPU models
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20191120173753.8894-1-pbonzini@redhat.com>
 <20191120184533.GT3812@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a86d16e7-c738-9b4b-e29a-518d94f174e0@redhat.com>
Date: Wed, 20 Nov 2019 21:49:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191120184533.GT3812@habkost.net>
Content-Language: en-US
X-MC-Unique: 0zxg52C3OmWyCVtJjDXGkQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/19 19:45, Eduardo Habkost wrote:
> On Wed, Nov 20, 2019 at 06:37:53PM +0100, Paolo Bonzini wrote:
>> This allows using "-cpu Haswell,+vmx", which we did not really want to
>> support in QEMU but was produced by Libvirt when using the "host-model"
>> CPU model.
>=20
> I understand guest ABI compatibility is not a concern, but I
> don't remember how we guarantee it won't break by accident if
> somebody tries to live migrate a VM.

I'm not sure I understand the question, but I can answer the second part:

> What is supposed to happen today if trying to live migrate a VM
> using "-cpu Haswell,+vmx"?

Before 4.2: same guest ABI compatibility as "-cpu host".

4.2+: ABI compatibility is preserved, because each named CPU model can
be given a precise set of features that are matched against the host
(and are subject to check/enforce).

4.1->4.2: the ABI *should* be preserved if you're running "-cpu
SandyBridge,+vmx" on an actual Sandy Bridge, but some VMX features will
disappear after live migration if e.g. you're running "-cpu
SandyBridge,+vmx" on a Haswell.  Host-model should be fine though.

Paolo


