Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADEE702AD0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 12:42:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyVeo-0004I9-HD; Mon, 15 May 2023 06:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pyVel-0004Hd-VG
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:42:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pyVek-00016t-Nu
 for qemu-devel@nongnu.org; Mon, 15 May 2023 06:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684147337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63vrd/4tArRcAhyJ1YWaVeNJC7LyBBje2xcf6qPbGaY=;
 b=Fs2XcdSZQnt47jI6+Ipk+aEtHJiI9NRdxcWeSpuAM9mipQQLyfT7SS8EJuKr+gFrA2Hu/C
 KYcuttB/oH8lGgUpW1aTlc6INqWczbF4yRi+mILEO9DUkXOLJbEdQ/vK0SFKfBDnxei80X
 xQ0vq6dRFNZVVxh4N1+MGKsxIpBSFKg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-_TCWUjvYOUi3yDII0oTJWA-1; Mon, 15 May 2023 06:42:16 -0400
X-MC-Unique: _TCWUjvYOUi3yDII0oTJWA-1
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-780f28fa351so2751199241.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 03:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684147336; x=1686739336;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=63vrd/4tArRcAhyJ1YWaVeNJC7LyBBje2xcf6qPbGaY=;
 b=MDYx4dL9cohA51etZtWm0n+ekESPIKVog3n0NYj9PBljyDeYTM5Agv6uqfStRWwDg+
 c1i8zYWzut5oHRcSncNEWl4p5AvZWoDvK7HOKl1GyxfUn6F9hw2GtpMfXyjL/ceZqz5K
 Y60//2v6DzawhqfOjR5m4qx43m6YZ2FqElFUSTAMx4YmprXRGUxowA04DHew70aEkBkJ
 LI0ICQkZEmXsAYYoRIDN1S/LRTXN/KyuZjZikmC3wHjN8LDZ4lnllujMRfhfiEyRNQ4x
 VOb1K+e57q6+qH5l2ARqlUeHA7NQgW4u7DC6CwDynmUPMxfO/hWIHbmYMBCnRD6cCxVo
 sCJA==
X-Gm-Message-State: AC+VfDzHDM7wA71kGiNmADwNGHu/0uF9HuNT74gnhBvwy4J1N7nb7AVF
 HVWRsxZdGZJHRF+X9+jtQaQsSQcFvKv0ks6Y+DTt73/y+IroWUaVbunDBLmYQj5p11UywPinE1y
 fh6jWOmetxly8cLuJmWufgGdHuQyYJGM=
X-Received: by 2002:a05:6102:364d:b0:436:3b1e:8a4b with SMTP id
 s13-20020a056102364d00b004363b1e8a4bmr4115039vsu.14.1684147336140; 
 Mon, 15 May 2023 03:42:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5vGk/gwROKixtsv+IjfKeJqQxuVzuU4Lv/oKdHbwp6erO5DhWXLv77Om9KuC+b30h+zH8rWx1p7s4ODh52pdU=
X-Received: by 2002:a05:6102:364d:b0:436:3b1e:8a4b with SMTP id
 s13-20020a056102364d00b004363b1e8a4bmr4115034vsu.14.1684147335913; Mon, 15
 May 2023 03:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230512124033.502654-1-thuth@redhat.com>
 <20230512124033.502654-17-thuth@redhat.com>
 <CABgObfbbpsUt6yn6XWDy=HS8z_ZDs088w1wgFk_cx3A8ZAizUg@mail.gmail.com>
 <a99c3cb8-94f0-125e-422d-c0a33211bf4e@redhat.com>
In-Reply-To: <a99c3cb8-94f0-125e-422d-c0a33211bf4e@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 15 May 2023 12:42:03 +0200
Message-ID: <CABgObfYRNW_vr2yd2kuaDZZyaMy=g259pMMfGdYK1V4Wajtb2Q@mail.gmail.com>
Subject: Re: [PATCH 16/18] tests/qtest/meson.build: Run the net filter tests
 only with default devices
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, May 15, 2023 at 11:46=E2=80=AFAM Thomas Huth <thuth@redhat.com> wro=
te:
> On 14/05/2023 22.31, Paolo Bonzini wrote:
> > We can perhaps
> > try to use QMP to check if the machines have a usable default NIC, and =
if
> > not skip the test, but this should not block the bulk of your work from
> > being merged.
>
> I'm currently not aware of a way to query the default NIC via QMP, so thi=
s
> might need some extensions there ... but I'll keep it in mind.

Yes, it would need some changes to MachineInfo (in qapi/machine.json).

Paolo


