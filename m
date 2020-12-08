Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ABE2D269A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:51:36 +0100 (CET)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYid-0001RM-In
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYhK-0000tn-M0
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:50:14 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:37691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYhJ-0004vC-23
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:50:14 -0500
Received: by mail-ej1-x641.google.com with SMTP id ga15so23520009ejb.4
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 00:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TZXwYDaCWS7e1DN18P4hTw8qRki8SYJYAh/bIEvt7VA=;
 b=FZ0lHPANfEWsj+/iVtzHykLTQO6ijRLMLun67MC83GxuH1p2GZvrYjVFI3LNftNYmi
 /WF/Ppj7Wq5wn6x5qlhZ7poOpmvIzR9WmdgY8pxNF30wGY0Co7IAbS2881d+bH0E6Byn
 bpioRfSGZZ4HMfmUGGDYIBx8I9lWUbAfa90kVnGyoX+TsCLBzuOSbLyiDTiWf1LMert8
 UgTYEKxN95dU+dYig9SnYr/1zjEk7X1WFDFui6Zn9YsLNmnCV9FZ9w0tvEVe2ihnVf8w
 L9O0G22F2V+wSKewS6KowfEZDIuF/m1OLAcCf+VIX9oZBeQmp9GyjwPdaUayPjCGVMO+
 P38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TZXwYDaCWS7e1DN18P4hTw8qRki8SYJYAh/bIEvt7VA=;
 b=PzAFvH/THVwXltDfMnBy1AfjDGQJxxFIuwiGkY/+nM3CHeZ8yWqroDyNC/5UDsgGeO
 uLVBDCZOdwA8KJ62oFf7jLnbnA9rljZSWVN8P2BOM4SIYShrxThULLx0FIlwgZPu3hly
 wMBl3eQQ1HaJWcAqvS++I358Z9YaCUDhPWa8nXY8QzNS6nUCd+SNbkhEEC6X63VGFS5a
 ASTxFtqpYnddj7vLWD1+SJ1O4zKI+sQVWd+HzG8OJrJBDo4KWXp1xyQeBishO7nmpPFd
 THWdLENDl6rqmr06UWLA6q4d7B3STReTXJK/Or9Kppf6vvC8O6Gxp+oCK4SDq2COUSmU
 36kg==
X-Gm-Message-State: AOAM531Q3nx7UfG+9bw6MLMJqVMXHgTpFjfySSiFyJByTfe7QiHU+f2i
 MQr7vJ9zsG9oJGUXO9lUbKg=
X-Google-Smtp-Source: ABdhPJww+kwZb8018JvYoa53FIBJf92vPUO/fyV4DEOGl5s9UG9EkjlxM/dxQWfVsgIsKRCS5yIpUg==
X-Received: by 2002:a17:906:3c11:: with SMTP id
 h17mr21899491ejg.20.1607417411619; 
 Tue, 08 Dec 2020 00:50:11 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id d6sm14878522ejy.114.2020.12.08.00.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 00:50:10 -0800 (PST)
Date: Tue, 8 Dec 2020 08:50:09 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 20/27] vhost: Return used buffers
Message-ID: <20201208085009.GV203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-21-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YnIutncTLXsDZs5t"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-21-eperezma@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x641.google.com
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


--YnIutncTLXsDZs5t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:58PM +0100, Eugenio P=E9rez wrote:
> @@ -1028,6 +1061,7 @@ static int vhost_sw_live_migration_start(struct vho=
st_dev *dev)
> =20
>      for (idx =3D 0; idx < dev->nvqs; ++idx) {
>          struct vhost_virtqueue *vq =3D &dev->vqs[idx];
> +        unsigned num =3D virtio_queue_get_num(dev->vdev, idx);
>          struct vhost_vring_addr addr =3D {
>              .index =3D idx,
>          };
> @@ -1044,6 +1078,12 @@ static int vhost_sw_live_migration_start(struct vh=
ost_dev *dev)
>          r =3D dev->vhost_ops->vhost_set_vring_addr(dev, &addr);
>          assert(r =3D=3D 0);
> =20
> +        r =3D vhost_backend_update_device_iotlb(dev, addr.used_user_addr,
> +                                              addr.used_user_addr,
> +                                              sizeof(vring_used_elem_t) =
* num,
> +                                              IOMMU_RW);

I don't remember seeing iotlb setup for the rest of the vring or guest
memory. Maybe this should go into a single patch so it's easy to review
the iova space layout.

--YnIutncTLXsDZs5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/PPkEACgkQnKSrs4Gr
c8jbGwf+OqBpKYq3vRs1xwb03191eAU1RZXGSRe283/ocJlVX8EMuoRMZPbbEXgt
+OqCILt/QQuvQloLfm23ggS9XXUgKfQSPG16bFM0RE6j5lDUqDWESbduxFWxWl5k
YAZhTPElTlaGeJbRpW4Ls2bqKSIkd77wtZu+AdPGGfr6IiZxE2rC3Rut3qhzl6A4
C2dhtR3TPweeG5bL8ls6tv3t9+J0n4tap8b93aX920+9ksgj1uYEZNjRk6jEWiMG
2vy5eEgE/SJcaNSFafSgYQGGscP3nAHCcwgkUs7MjiGyVXiMNi0xDGunPdQ1R/f/
/Sto7Mj12OlDF0kbMRUuNi5FfF3wOA==
=vcmP
-----END PGP SIGNATURE-----

--YnIutncTLXsDZs5t--

