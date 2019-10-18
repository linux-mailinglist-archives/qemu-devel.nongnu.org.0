Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60515DC5DF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Oct 2019 15:18:31 +0200 (CEST)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLS9G-0004Hw-21
	for lists+qemu-devel@lfdr.de; Fri, 18 Oct 2019 09:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iLS6e-0002i7-NI
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:15:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <qemu_oss@crudebyte.com>) id 1iLS6d-0005Yi-Fp
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:15:48 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:36441)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <qemu_oss@crudebyte.com>)
 id 1iLS6c-0005W4-Tj
 for qemu-devel@nongnu.org; Fri, 18 Oct 2019 09:15:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Kp4HYJDHNEKmOJfuEN8/j/a9aK4OYU5hQ6PcyIRX6GI=; b=L/MvreJl8y3ll1JRYWw76UPUyi
 Bp88td0NxmdYmikTXm5VhUAnAd0w07fC9BxIrMo9EME4SMh7xOJS0JpQxm3GTj6TDX1lN4rRTQqCg
 2XsoKx9XQT7sye7HrMDGgWB4aDSUJKdjV8//1OUfDjM0ZUTBjmCb6ANBc0HwLZb901ptM7QLcRD4u
 JGmPne9vxAX3MLByHU1+VA4BixipitHkaYCoa72+CZ4ZWKdAHmL6fzvUl9zCtls84aAsM68kMyE3k
 EXoIZ/3znD9ItUOcVE+khBiWsCdycCbHW8Qj89BNMMw1YXN/eCWE5GOA0tHb+ppkgE35TRM3sAm4J
 WXQBYy75heBMx7ZNm6m1Bva/GiTC8vPlv5lfhNGY0Y/fSBZouygUdIa1GQZxXFGd2b8oghTcr7G3L
 ZWsU7yLd8PW1ndWHyFSVhjPsEWnsWIWKmmPJBrlj5Z5GY7MsyGcM2/Hkw7FOLUPrsYnTWYQengxzy
 ZpmpGzA6Zf9C9GRDizc0pXOdsqxt7v0+ycpdoTsS6MRCi8QLYBbPTOGrIIO51atUWNVgY3UAon4UY
 mEHv5oSTBfBM7QeCHp63wWWTV1Pylrhjzwt9Gp4tPcQ3Ewp+b/qySabl/XkSzC3aeU54GeZRp6sDo
 RH67uClnDiR6jyVWWpUkHlPH8AGRmct1T4/589t+c=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Antonios Motakis <antonios.motakis@huawei.com>, Greg Kurz <groug@kaod.org>
Subject: Re: virtio-fs: Fix file ID collisions (was: 9p: Fix file ID
 collisions)
Date: Fri, 18 Oct 2019 15:15:43 +0200
Message-ID: <4866803.EgEq5jnlfW@silver>
In-Reply-To: <20191016134409.GG2978@work-vm>
References: <cover.1567680121.git.qemu_oss@crudebyte.com>
 <4114483.KuMf1QML1b@silver> <20191016134409.GG2978@work-vm>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 5.189.157.229
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

On Mittwoch, 16. Oktober 2019 15:44:09 CEST Dr. David Alan Gilbert wrote:
> > > Unless I'm missing something, it seems that "virtio-fs" has the same
> > > issue we had on 9pfs before Christian's patches... :-\
> > 
> > Is a fix for this desired for virtio-fs?
> 
> Yes I think so;  we had originally thought we were hiding the host inode
> numbers; but that's not true - since we pass both a device and inode
> number in virtiofs, unlike 9p, it seems we can probably get away with
> only remapping device IDs rather than inode numbers; but that requires
> some understanding of how multiple block device IDs are supposed to look
> like to the guest kernel.

Postponed on my side then. My original idea was simply sharing the existing 
inode remapping code from 9p. But remapping/adding device ids on guest side 
like you suggested is cleaner; takes more time though to lookup the required 
kernel interfaces to achieve that.

Best regards,
Christian Schoenebeck



