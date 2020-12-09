Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308142D4B1F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:58:30 +0100 (CET)
Received: from localhost ([::1]:49836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5bZ-0007Og-8b
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn4V0-0003hE-IE
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kn4Uu-0003cI-8a
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607539651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yrfjyaqj4L5BFqPSfVQQDLQ7l1oJGf/95/9z1Mukkqs=;
 b=fp6f7nL/ZbpJdJKA1dl9PGT7FsdYh2srTX6DNSoMrgyfqA1HRJA4JErugcsKvsdZS6J77d
 vFeFmOvLavFpQDDh7NX/cRa6DloVubIxfO3YH2JAP0ZfnRTs6xQtNAc3SCicAnt0UC+TtK
 oE7aY+hLE7NwRAGdQQCL7dLqb21Q/Gc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-n8cN-dW_MkSJ8GSjvavcuA-1; Wed, 09 Dec 2020 13:47:27 -0500
X-MC-Unique: n8cN-dW_MkSJ8GSjvavcuA-1
Received: by mail-qt1-f199.google.com with SMTP id a11so863431qto.16
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yrfjyaqj4L5BFqPSfVQQDLQ7l1oJGf/95/9z1Mukkqs=;
 b=N2BnP5gKEUnOdbvSewVMtNAWNToY8obGPNtTr8ievVzmC2SSxxirqjNqtnUoDR2RtU
 Q+ga0jLiQWXdHYefTLMQh5k5vbuEdsWHcRFCv9Mb3HpnBFhi73ykfmVoRcyUb1yBQW2e
 eztpY2iY1HatfiFq/WdmOZquKLztD0zHuPVNoMaWg5Isjmtrn5oNqVmeZZbiOoRZkfCY
 4BPrba/8ctPGY4v1oOH9Nl4OzoExRTsMqQi7u3EwFbFA5PESYVLtmQMUMHPy3gKWspCX
 zEzEMvryi2LEf83u5Ui2+5awR5qKtHpnt3P88qteyc2rKgR4knhuyeqM5+MMch+YfN29
 b+FA==
X-Gm-Message-State: AOAM531F+9975MHYpiDChEG03U0yYaSG+PEgLuSxQjfQNeHah9119voS
 5WzSfbuL5lgoGuK6VO5rOsiC+rDj7IShbuUTP3oxnb0bm0NrgPUS3ZGtSjfp5HGz9UB2dQCeY7S
 MYmW//n8R26lUkZSxHobAQKH8t/j6BYo=
X-Received: by 2002:aed:2742:: with SMTP id n60mr4678346qtd.221.1607539647093; 
 Wed, 09 Dec 2020 10:47:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGw7c+xnc6N0H9X/g1O8JWP6r/KrIswT9lVGNbdosIwMEkBtS/32ZQWoZKrT4z06MWCEuozyqQRgwYBZN7ig8=
X-Received: by 2002:aed:2742:: with SMTP id n60mr4678306qtd.221.1607539646912; 
 Wed, 09 Dec 2020 10:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-17-eperezma@redhat.com>
 <20201208082552.GT203660@stefanha-x1.localdomain>
In-Reply-To: <20201208082552.GT203660@stefanha-x1.localdomain>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Dec 2020 19:46:49 +0100
Message-ID: <CAJaqyWdN7iudf8mDN4k4Fs9j1x+ztZARuBbinPHD3ZQSMH1pyQ@mail.gmail.com>
Subject: Re: [RFC PATCH 16/27] virtio: Expose virtqueue_alloc_element
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kvm list <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
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

On Tue, Dec 8, 2020 at 9:26 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Fri, Nov 20, 2020 at 07:50:54PM +0100, Eugenio P=C3=A9rez wrote:
> > Specify VirtQueueElement * as return type makes no harm at this moment.
>
> The reason for the void * return type is that C implicitly converts void
> pointers to pointers of any type. The function takes a size_t sz
> argument so it can allocate a object of user-defined size. The idea is
> that the user's struct embeds a VirtQueueElement field. Changing the
> return type to VirtQueueElement * means that callers may need to
> explicitly cast to the user's struct type.
>
> It's a question of coding style but I think the void * return type
> communicates what is going on better than VirtQueueElement *.

Right, what I meant with that is that nobody uses that feature, but I
just re-check and I saw that contrib/vhost-user-blk actually uses it
(not checked for more uses). I think it is better just to drop this
commit.

Thanks!


