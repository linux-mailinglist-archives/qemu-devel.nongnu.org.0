Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA1356D5E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 15:34:43 +0200 (CEST)
Received: from localhost ([::1]:38164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU8KQ-0004UR-DG
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 09:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lU8J0-0003gd-Nr
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:33:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lU8Iv-0004DN-Tn
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 09:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617802388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ADTSls/7YM5hICjZvXscfOVlqP91ZhlsrjW/hEn0PtY=;
 b=RmA4ad7AMgPr3Os1L9G0P/NRFGDBCDm+JQ5ul7ppC1uGMjb2sQXvBBp9VAJJ8p21xXM/mu
 hCUX5LFxXC+QXVVYwAmkoPWpd4Bi6coFibKK3zyMUuDFmWj0a/uO54grLM1feuO8HvWSon
 Q8LG7exIM++sc04V5trJVgZQosfy2Ww=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-_rxhZDAJMN2JgxLs4djT9g-1; Wed, 07 Apr 2021 09:33:06 -0400
X-MC-Unique: _rxhZDAJMN2JgxLs4djT9g-1
Received: by mail-wm1-f70.google.com with SMTP id r18so1350199wmq.5
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 06:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ADTSls/7YM5hICjZvXscfOVlqP91ZhlsrjW/hEn0PtY=;
 b=hZ4SzClbCDjbXA7QNThUFUb5a9MlPFgISyNczar38i+JrSHPkiarsUnUZsvLNTWAu0
 nSaC2P9ZzmVZY9g8PH1r/Kg/QRvO8qMESavTUX8mJOnAMFz07JaZtlck2cnjCFE9kjnL
 vLSq3FOvEpuHF73nrYZ7UnbWXve/955kut1t47ZSRGwbcj0LFNl+3cyCoujovnLvGTEa
 v8deXet3gqNm9BYyKuUvXfyzpzPReIp8ChUplq6yZvalJMyfgI7pFwloS5TI4z+vNrEJ
 XaVBvif4zsYkjk2XAruh2nRRNhqIUSJvfwOLTdi9Qu+6kg+H+g3DO0Qm69MT1nPSCVC1
 hpKQ==
X-Gm-Message-State: AOAM5302RiWI8yyLo8qxBlbkaamFX6sbRbE9T/KnynWk3GEfZ2iijcdy
 ZHR7iEv3UrYfmcfLP8jBIH107F5uge5n4j7YQEX+XmTT8OE6Vv3V8BjXgHMUMZ7MskDvO5juIuY
 4AJlAE/1nZ4O8Quw=
X-Received: by 2002:a1c:b7c3:: with SMTP id h186mr3072530wmf.140.1617802385259; 
 Wed, 07 Apr 2021 06:33:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzPF8AlwrZ8bTOE3gLh+FA2iI/n0NspIMyU+H2Qp9mIQGxoehbHBKCjbt9hd3kstLeGMGxDw==
X-Received: by 2002:a1c:b7c3:: with SMTP id h186mr3072515wmf.140.1617802385079; 
 Wed, 07 Apr 2021 06:33:05 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id c18sm13605161wrp.33.2021.04.07.06.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 06:33:04 -0700 (PDT)
Date: Wed, 7 Apr 2021 09:33:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v3] hw/smbios: support for type 41 (onboard devices
 extended information)
Message-ID: <20210407093117-mutt-send-email-mst@kernel.org>
References: <20210401122658.37842-1-vincent@bernat.ch>
 <20210401225846.411ebd76@redhat.com> <m37dllk939.fsf@bernat.ch>
 <m3wntkio0c.fsf@bernat.ch> <20210406210558.15749f84@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210406210558.15749f84@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Vincent Bernat <vincent@bernat.ch>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 09:05:58PM +0200, Igor Mammedov wrote:
> On Fri, 02 Apr 2021 19:40:03 +0200
> Vincent Bernat <vincent@bernat.ch> wrote:
> 
> >  ❦  1 avril 2021 23:07 +02, Vincent Bernat:
> > 
> > >>> This can be invoked with:
> > >>> 
> > >>>     $QEMU -netdev user,id=internet
> > >>>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
> > >>>           -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev  
> > >>
> > >> an ACPI alternative was merged recently (current master).
> > >> assigning 'designation=' wasn't implemented there, but important part
> > >> of giving users control over PCI devices 'eno' index is implemented.
> > >>
> > >> When I looked into the issue, smbios way was a bit over-kill for the task
> > >> and didn't really work if hotplug were used.
> > >>
> > >> See, for example how to use new feature:
> > >>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg794164.html  
> > >
> > > It seems simpler this way. I don't think my patch is needed then.  
> > 
> > Well, after thinking a bit, if the patch is good enough, maybe it can
> > still be merged. It is fairly generic and it adds the ability to set the
> > name of the card. It's not as convenient as using acpi-index, but I
> > could add a note about acpi-index in the documentation to let people
> > know they may prefer the simpler acpi-index?
> 
> Patch looks fine to me.
> Can you fix TODO item in it (segment_group_number) on next respin, pls?

One advantage of smbios is that it supports multifunction devices.
So there's that.


> Also QEMU now is in soft-freeze, so only bug fixes got merged,
> it's better to ping Michael after 6.0 is released so patch won't get lost.


