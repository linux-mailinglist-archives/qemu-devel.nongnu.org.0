Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFEE2D25E7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:29:21 +0100 (CET)
Received: from localhost ([::1]:48662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYN6-0001R4-UZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:29:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYJq-0008Ed-Lu
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:25:58 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:46776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYJn-0004pJ-UK
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:25:58 -0500
Received: by mail-ed1-x542.google.com with SMTP id b73so16630766edf.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 00:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CRRpx8acZX4QjtTnMIWAXX++AMuePl61ml+xI4XshWU=;
 b=fOK/3HgiuVBZ02q0KOifw6SzUXjBYw5+AuClkdFIgY1bJpmlwwdbHVyVivO0eg+aa2
 JhYZdRbBcHtFNThHnS9vSHXgzNgZeaJEBYXDf+pb/wF3NqwCKtbzTo4BTUNaoLugNuZH
 Pjmhf/0107cUNmr1PnADrcmbvF7Xsg9WQLMYay/4/HoolpX8IO6F7BV0/6z84Ayj6tyC
 t5UJEqv5AmQuY9sKeu1suv8qLhIIZKBjCrXblTOv0AkITuMqGH+5DqYFYgff4E0Yiawv
 voT9qUCZKgkr2A3wCFgycaL2kPM43WHTbx/qHUPsQYjC/mtOwMW7GE/3K/ArfNn4RJWd
 ZhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CRRpx8acZX4QjtTnMIWAXX++AMuePl61ml+xI4XshWU=;
 b=AXILk71+u4D8veI4znuhoIpo2bxDk1F2UNfRV6DxnjP3JhQtyikZH6Jtj6VHU/tV0P
 RVrm+iok5IZyK3KjbXGsTQM+MUFdPqYqO769Irv40lFqKRQ0z/a42PyJzRcQiH2S4mPd
 7ttqW7lQS9WZJ/k8HZpFHoYOKBBDIxrSFSBbdotXz8XFOf0g1N7DkeY/LIwUu7d4MY7Q
 +XrRbvwtd2HQ8QX/our9yf3uhQmpw6sBS8GsGah3lJN5g84HClHW9XRS3/r0Vw76jDVq
 Za+pmbRwzMuxYUdnLBvJxXKG+DyceHA/OQJQBbC9rpcf3GCZPG9sDN2uLxUw3TTION6L
 EA9Q==
X-Gm-Message-State: AOAM531lAOo4BxsEVG1OJn9FTg9i3GUJpJB4JCbuUekfYGc3W4ybJclq
 R+IxlAlz7kLR5DHB4t0hqX4=
X-Google-Smtp-Source: ABdhPJwgXgn+yrMMIjilMjVvsLWwQHozsuf+tTEAZtoyMOYhysd+aHWNX+tUMzVsB8iXuDrM/o5tQA==
X-Received: by 2002:a05:6402:3074:: with SMTP id
 bs20mr23700631edb.365.1607415954491; 
 Tue, 08 Dec 2020 00:25:54 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id rs27sm15112106ejb.21.2020.12.08.00.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 00:25:53 -0800 (PST)
Date: Tue, 8 Dec 2020 08:25:52 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 16/27] virtio: Expose virtqueue_alloc_element
Message-ID: <20201208082552.GT203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-17-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="80Ds8Z/hZmemMosa"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-17-eperezma@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=stefanha@gmail.com; helo=mail-ed1-x542.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--80Ds8Z/hZmemMosa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:54PM +0100, Eugenio P=E9rez wrote:
> Specify VirtQueueElement * as return type makes no harm at this moment.

The reason for the void * return type is that C implicitly converts void
pointers to pointers of any type. The function takes a size_t sz
argument so it can allocate a object of user-defined size. The idea is
that the user's struct embeds a VirtQueueElement field. Changing the
return type to VirtQueueElement * means that callers may need to
explicitly cast to the user's struct type.

It's a question of coding style but I think the void * return type
communicates what is going on better than VirtQueueElement *.

--80Ds8Z/hZmemMosa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/POJAACgkQnKSrs4Gr
c8iIOQf/eNAzxK1ncAAJ6gkC5ZN4/DQUgcfZBmB/a4jRwojXtH7Tkr9soSJU/TN+
1mJPWNebsod4iVWGO+yl0y+YL4Iif2d2TSFpiyZvwOyNY1KAXpSgm3TwsbBW1UkG
WduAcNnpl06uIFb+x2w1aQlVE7RMaCFKRSw7GgLxDxuBJipan4LO+cDLlgwJk62z
RMsgHlzhfHZ9Kq2MMbZkwF4Etz1sWFOkn80cbFQT247Mn6Kx0KtU3RM7ubowKDmY
fXsySdAnqcU8fNv+7Oi3lM1zHI2jWTVPbfvmFDK7cYghlUU5lQJlUSC2icXRKm1T
OtyLrwUxDfPwL4895JADTzpPAwngDA==
=Cecc
-----END PGP SIGNATURE-----

--80Ds8Z/hZmemMosa--

