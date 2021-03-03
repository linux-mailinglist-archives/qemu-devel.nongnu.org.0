Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4297832B98C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 18:42:50 +0100 (CET)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHVWL-00080b-Ba
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 12:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHVV2-00074l-8d
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:41:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lHVUz-0004QY-7N
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 12:41:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614793283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Us39iYrzIESjG7utukiqb91S7XVSiPPPAurr0THeRGo=;
 b=VdeF3WXT20YkMsUTIhNo4ussZVxvSMK5NjtQ9HDUHZzgHw6KC8fBmqEL18fPTGZ/vhe6r6
 m88x5itI7AFhe3OLI482Hx7QvHh4ag/wPaDoPvWgCSUCr+w+in2aUtoqPaU0UicfmGmY2x
 OdLqhA7mJ1TTyzJy67U9wxnAoOhqVwk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-cgg2kCWpMkefz2z1lXGf2A-1; Wed, 03 Mar 2021 12:41:02 -0500
X-MC-Unique: cgg2kCWpMkefz2z1lXGf2A-1
Received: by mail-ej1-f72.google.com with SMTP id w22so10913654ejv.18
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 09:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Us39iYrzIESjG7utukiqb91S7XVSiPPPAurr0THeRGo=;
 b=bU/v/qXWeLe6LqxgfB6db37v3E+KJWwfj1lkP38sDabGOFkekdjQHvawmXKKulgDyW
 KE0KSauGS/bTn1seWr/7QtTJyz6gJX2wsac5GLGAW9cB03wVP5Fn1X0lt2VgEReoiO+T
 i/bI2xTXLZ5eC62b3EXLOfFVKsQGClHTTJHv6ctTEDm7KylF8jCCCsRKJd4fxLq21jWx
 4zC/4oDERtkYmUmnrMdtcwHdvV2rkZcPD/9b/SGEyHn1uobBtRw7jQM/KaKCqW6kzrKN
 7MLRqCyFuzSURy9XcgGSZ6DzmnNz2GD16TLqd9mneARAuAWOLv1HKlo3XXDZzV1dhcjp
 jN5A==
X-Gm-Message-State: AOAM530C1siiSpXkLKGSL8lu4PG3/goQ7VnyoUxmbnwMlnj8wAh+WpXH
 QkES2DIrmhWCUStHNoHIQExQX3mgf4x7bD0fH2GhKkw1kq9hzE4wPpRmHNyfK8U23GH/pzYvajl
 +mxpgIhsgRrwBEX8=
X-Received: by 2002:aa7:c84b:: with SMTP id g11mr393277edt.169.1614793261054; 
 Wed, 03 Mar 2021 09:41:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQJcO2Mf6zZRJA0IKQfrAMjyvtH5fJ26uH/XFTF9VHVkmQv0ZiUQu9d9hYjCARz/uRM1+Pqw==
X-Received: by 2002:aa7:c84b:: with SMTP id g11mr393264edt.169.1614793260882; 
 Wed, 03 Mar 2021 09:41:00 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id s14sm21926821ejf.47.2021.03.03.09.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 09:41:00 -0800 (PST)
Date: Wed, 3 Mar 2021 18:40:58 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Dillaman <dillaman@redhat.com>
Subject: QEMU RBD is slow with QCOW2 images
Message-ID: <20210303174058.sdy5ygdfu75xy4rr@steredhat>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,
as reported in this BZ [1], when qemu-img creates a QCOW2 image on RBD 
writing data is very slow compared to a raw file.

Comparing raw vs QCOW2 image creation with RBD I found that we use a 
different object size, for the raw file I see '4 MiB objects', for QCOW2 
I see '64 KiB objects' as reported on comment 14 [2].
This should be the main issue of slowness, indeed forcing in the code 4 
MiB object size also for QCOW2 increased the speed a lot.

Looking better I discovered that for raw files, we call rbd_create() 
with obj_order = 0 (if 'cluster_size' options is not defined), so the 
default object size is used.
Instead for QCOW2, we use obj_order = 16, since the default 
'cluster_size' defined for QCOW2, is 64 KiB.

Using '-o cluster_size=2M' with qemu-img changed only the qcow2 cluster 
size, since in qcow2_co_create_opts() we remove the 'cluster_size' from 
QemuOpts calling qemu_opts_to_qdict_filtered().
For some reason that I have yet to understand, after this deletion, 
however remains in QemuOpts the default value of 'cluster_size' for 
qcow2 (64 KiB), that it's used in qemu_rbd_co_create_opts()

At this point my doubts are:
Does it make sense to use the same cluster_size as qcow2 as object_size 
in RBD?
If we want to keep the 2 options separated, how can it be done? Should 
we rename the option in block/rbd.c?

Thanks,
Stefano

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1744525
[2] https://bugzilla.redhat.com/show_bug.cgi?id=1744525#c14


