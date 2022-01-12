Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF148C95B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:28:06 +0100 (CET)
Received: from localhost ([::1]:50696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7hPo-0005zz-T8
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:28:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7hNQ-00022q-NB
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:25:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7hNO-0007SM-AO
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:25:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642008333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rD0cghWn2Z9abNua7h6UXbf4Pzeb1Ih2LhGqPnO5fGM=;
 b=V93Cl59HagNsK3zE4mC1JAQU3hlEfZ8cGVCBhnxS5PE4ue/uPAc44LA5fy9wvvVcW2uU1J
 jWS/DfO+ra5LiNDwHPRceLa7NiJy9YC9+uNtbyT/Hm7qWnadX0PKExtkfIjnk7+eZ69o8p
 VoB3tPgw8xn4NpRj/0AuTdn2GzgATG0=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-bNo9QTe-MKioLZC1O5tmmQ-1; Wed, 12 Jan 2022 12:25:28 -0500
X-MC-Unique: bNo9QTe-MKioLZC1O5tmmQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 n15-20020a1fa40f000000b0031698b506b8so668201vke.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 09:25:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rD0cghWn2Z9abNua7h6UXbf4Pzeb1Ih2LhGqPnO5fGM=;
 b=dlMse0Q4uhsiXyHQoajQswctP6f0E9tGvSR2EfV4YCEV75bTSuMFs1Hc9kr71mRJBd
 D+AVaeSJJJx2/abGv90HOyL1qU4gbiII0aZlkDroxB1huco0syqwz5xxT9e69P90Yg7I
 3nNBtyj4fyYVI/DtnkSYIBqYqNuKd5EwzF0z1jWnTMTAP6G8rjF0abmRRs1Rkq3cK2XD
 BANWwtIhkWJgPMxwUN6eo988yP9OJT2NoEI1v/LN3JuvUyYYWx45C6j1xCajn7k4rWPQ
 9+M2ICusjETdr19YHfTC3cHrBVtIGYgW94VdBh//gGsslYQR6/pc7Erolj+9ZN43v7IF
 DGEg==
X-Gm-Message-State: AOAM5308uFqSsB4nWqpXmSza8kIh1d0zIuBN7qv6v3NHtSJ60pVZCP4R
 9/QmgAleczj8+Kgy0epcIKCLml8jHM/nUhYMtvKCr9SWkdpoXJ2KyNrwn12sE7VcJqaabnzbFNL
 xT8U67vFxQtuTDbzenGlsHBOFlo5TmwU=
X-Received: by 2002:ab0:6497:: with SMTP id p23mr472472uam.32.1642008327837;
 Wed, 12 Jan 2022 09:25:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzkohy2GxAC6KfVYQUkzv14EzMhFx4Yn6c4lZIFleLFU1g2WmqbPNX4i4BFCyXLv/IeGUdS7Tjq71eO2dhsvsE=
X-Received: by 2002:ab0:6497:: with SMTP id p23mr472452uam.32.1642008327644;
 Wed, 12 Jan 2022 09:25:27 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-b+ene2vKCCDJR9viT9P=GyhBeAO5ZLGsUmiijoxrkfCg@mail.gmail.com>
 <Yd6z2WS3hGwPNKkl@stefanha-x1.localdomain>
In-Reply-To: <Yd6z2WS3hGwPNKkl@stefanha-x1.localdomain>
From: John Snow <jsnow@redhat.com>
Date: Wed, 12 Jan 2022 12:25:16 -0500
Message-ID: <CAFn=p-Zb3fmj5sf=+dGizxiYTySM4gU2Q6wudxnf67X=6nsyvQ@mail.gmail.com>
Subject: Re: PyPI account
To: Stefan Hajnoczi <stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 5:56 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> [Context: John created a PyPI QEMU user in order to publish the qemu.qmp
> package. If anyone wants to publish additional Python packages from
> qemu.git, please contact him for PyPI access.]
>
> On Tue, Jan 11, 2022 at 03:42:23PM -0500, John Snow wrote:
> > Account made: https://pypi.org/user/QEMU/
> >
> > I can't update the wiki, I lack admin perms to edit
> > https://wiki.qemu.org/AdminContacts
> >
> > I assume in the event that I fall into a black hole or get launched
> > out of a cannon into the sun, any mails sent to jsnow@redhat.com can
> > be recovered by Red Hat in general, so there's a sufficient recourse
> > for recovering the account in that circumstance.
>
> Thanks, I have added the PyPI QEMU user and added you as the admin
> contact:
> https://wiki.qemu.org/AdminContacts#Other_resources
>
> Stefan

Thanks, Stefan!

As additional context, there is currently a single package that
belongs to that user, "qemu.qmp" [1]. I published it "in advance" to
be able to test integration in an RFC patch set I posted to the list
just before the winter break [2]. The package is an "alpha prerelease"
and is at a very low-risk to be installed by accident. The version
chosen here will be considered "less than" any other valid version
string chosen, and can be deleted permanently from PyPI after
consensus on list review. Please forgive the mid-review publishing.
The exact metadata, wording of the README, etc is still under review
here [3].

As for the PyPI account itself, I have volunteered to administer it.
If anyone wants access (esp. a leadership committee member from
another employer), please contact me - I'm happy to share.

[1] https://pypi.org/project/qemu.qmp/
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg02840.html
[3] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg02418.html


