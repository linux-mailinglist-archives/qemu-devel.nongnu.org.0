Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D634D5C26
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 08:20:00 +0100 (CET)
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSZZ9-0008Iv-4U
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 02:19:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1nSZSv-0005eq-PG
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:13:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eskultet@redhat.com>)
 id 1nSZSs-0005zI-3Q
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:13:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646982809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L9I2rwedEouBd+Sfp8dtYJGTeR+i0ngykZ7941DaD4A=;
 b=K2Ufe5qGCqbvvitmkRcDzDTr7lYJ4frqlQgdr83xIUUQRuy0VF6GgwwqSi4BA3Kex71FzF
 an4D69Xpd/aXIEX04Fs10TAfyfTkNPQMA2MMYZraA2nmdrr54BdZ2GwPudo+iiDPP/IpA0
 ONGOg4vVGL6MqGAYDn/gZ6vAWvH78Dc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-Z6qCyg_GNNOzLyXPH4_hNQ-1; Fri, 11 Mar 2022 02:12:15 -0500
X-MC-Unique: Z6qCyg_GNNOzLyXPH4_hNQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 hq34-20020a1709073f2200b006d677c94909so4460825ejc.8
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 23:12:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L9I2rwedEouBd+Sfp8dtYJGTeR+i0ngykZ7941DaD4A=;
 b=Vu5T8f33nqOaeOdF00AlFIa6dFG8cOdZJ5qq7RwCy4fnoyTs3Quo8SP2ocbKQ1joU6
 GKVBii8A1GAyZl7v0DOHdqsAySpdRjxdhOwzPBivwjVzHlaqc3ohVtiqaCBbM2EVHrWP
 1zRk6eTpp5R6ZE/qxXKZ/M626h3JubV39dbaGHmefADq+eSZG39u0qva6OcOY4ZHOxCK
 GX4aJh3KF+cznjydF89DpdZQUCBVukEgd/w75bgVwVlQpzHTJAJigj3I7eSkZF8zKY0V
 DssP9Fhuo3HUIzbbj07qYYSI3ym30zA6AlhY18d0I4GNB3O/+qI0hZh5x7cdqcpPrQR8
 TJXA==
X-Gm-Message-State: AOAM532yJzjHnVDi2UrdMyeaVGpc0hb818QL8V8wgIXKr44Ujz8QQ4gy
 CTnnbOoSRKdhKboIDQpfpBKuPPHn6vj9sMnrJURn9Imvxxjli2uV5BtMnZTmUQXVaXuw7aeS17G
 LWr2yXZNpl36hm7g=
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id
 o17-20020a170906775100b006ce0e3c81a6mr7074667ejn.278.1646982734296; 
 Thu, 10 Mar 2022 23:12:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGqBzeOKavdBzLUZM1NH84FRYOa1IFwmHjVAHG4WufGvmqiaOf4A8brnzVTmrEINwxBkWN3Q==
X-Received: by 2002:a17:906:7751:b0:6ce:e3c:81a6 with SMTP id
 o17-20020a170906775100b006ce0e3c81a6mr7074660ejn.278.1646982734071; 
 Thu, 10 Mar 2022 23:12:14 -0800 (PST)
Received: from nautilus ([95.82.134.59]) by smtp.gmail.com with ESMTPSA id
 gv9-20020a170906f10900b006d7128b2e6fsm2611348ejb.162.2022.03.10.23.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 23:12:13 -0800 (PST)
Date: Fri, 11 Mar 2022 08:12:11 +0100
From: Erik Skultety <eskultet@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [libvirt] [PATCH RESEND v2 0/4] re-introduce <acpi-hotplug-bridge>
Message-ID: <Yir2SxvhTskJgOda@nautilus>
References: <20220308063955.2285902-1-ani@anisinha.ca>
 <399ca3a9-8b95-39af-8376-85f2edf00c7e@redhat.com>
 <f744a5f1-6dde-4b57-d52a-9b6104c5e510@redhat.com>
 <alpine.DEB.2.22.394.2203082212120.2312236@anisinha-lenovo>
 <20220308114638-mutt-send-email-mst@kernel.org>
 <CAARzgwwo6weTL8Q_2vbx9s2+r_LerEgDiWRLEJvgyC=YNVOVFw@mail.gmail.com>
 <20220308121820-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2203091245190.2312236@anisinha-lenovo>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2203091245190.2312236@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eskultet@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eskultet@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: libvir-list@redhat.com, qemu list <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 12:47:26PM +0530, Ani Sinha wrote:
> 
> 
> On Tue, 8 Mar 2022, Michael S. Tsirkin wrote:
> 
> > On Tue, Mar 08, 2022 at 10:23:20PM +0530, Ani Sinha wrote:
> > > On Tue, Mar 8, 2022 at 10:17 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Mar 08, 2022 at 10:15:11PM +0530, Ani Sinha wrote:
> > > > >
> > > > >
> > > > > On Tue, 8 Mar 2022, Laine Stump wrote:
> > > > >
> > > > > > Aha! the domain of qemu-devel@nongnu.org was incorrect in the original send
> > > > > > (it was "nognu.org"), so none of this thread was making it to that list.
> > > > >
> > > > >
> > > > > Not to give any excuses but this happened because on Qemu side I never
> > > > > have to type this manually. My git config is set up so that
> > > > > the cc in send-email is filled up automatically using
> > > > > scripts/get_maintainer.pl. On libvirt side also the domain and mailing
> > > > > list is easy to remember. Its only when I have to manually type stuff that
> > > > > shit happens :-)
> > > >
> > > > Donnu about alpine, but with mutt you can easily set up
> > > > and alias and then it expands for you.
> > >
> > > I use alpine to only reply/review patches. I use git send-email to
> > > actually send the patch. There I am not sure the best way to avoid
> > > manually typing in the mailing list address.
> >
> > send-email supports aliases too.
> 
> Ah cool. I just set this up with some help from
> https://felipec.wordpress.com/2009/10/25/git-send-email-tricks/ . Now I
> can simply say
> 
> $ git send-email --to=qemu-list <patch>
> 
> without worrying about typo :-) Thanks for the pointer.
> 

So, in context of sending patches to mailing lists, especially with libvirt and
QEMU, you could utilize 'git publish'. Both QEMU and libvirt have a .gitpublish
config in the repo which sets some git-send email options, especially the
QEMU's one is nice listing a bunch of common profile templates as well.
I'd say that if you're contributing to a project which doesn't have a
.gitpublish config yet, then rather than not using 'git publish', the project
should adopt the config instead :).

Regards,
Erik


