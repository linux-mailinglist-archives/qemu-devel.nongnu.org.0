Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC9F2B4411
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:55:33 +0100 (CET)
Received: from localhost ([::1]:58900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kee2e-0003T8-MF
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kee1p-0002xn-Hz
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:54:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kee1n-0005Fn-8j
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:54:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605531278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6Wn6aECuf4nkRB//qXBGjfZdsf8tlY9l4saZUEMZrss=;
 b=JHgvHjBg8ROESKLxXQ1gLTmML0zNCzJHdcljCpi4ySmQTYNghGBlCFwD5LXjsQzfE/CZX/
 Bpi3RlnROqD60QhWae93Oq/ivVuCLYhVc5LrLVwJcZCs3HApvt0imvwlCQnY+ClzT4NFLG
 GtIYJQtNzgEn0X0Kwkfmp3dwtwdAfc4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-dPEGcmrwNHi2RG-_3TPEsw-1; Mon, 16 Nov 2020 07:54:36 -0500
X-MC-Unique: dPEGcmrwNHi2RG-_3TPEsw-1
Received: by mail-wr1-f70.google.com with SMTP id h13so5656913wrr.7
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Wn6aECuf4nkRB//qXBGjfZdsf8tlY9l4saZUEMZrss=;
 b=rFxjw5ITGxjEiPcXYJqtlIhiKQlFqX0BS4V8/TDtH0e+gSRulWN3Q8/QuY3inDcKT9
 uw4VzxFjVi32bEzFE9BWDsSW/VBFaL6EzqfqD5qrHcak9bEgrRArw/NAU574rXPmgtDr
 vpzuJDOaLtIFWRgVZ9u1nx1qU+vP2pPPlh5d5f0lt1R83Fz+l0Hja5zp15UhcoZT9TYo
 p5NCzZhLY3rRANqcD1lR+1ssuTF1TsdX+MsrJzkdrUfXA+XvEnZiKRLuG4q1p3Ivu0JA
 7HElymAJsZwTb4lOyUQvTzPhMJy3qkHSVy0+fOdFySmksdlDvZiKq6BDKXe3CaHm4Igr
 I9Uw==
X-Gm-Message-State: AOAM531ogAXYOzbkhXxfcNbSyuI5fbPhYv3VwoPhVIn1xbDm2JDNKfHa
 lwQPYjG51sCef8ioimmEkf3gKKM3oIwjqRebA2STN4HgYkT/hVq7T+aDsCLEYyZZMBep/UEfzjv
 gatQV8JaGJgacIUk=
X-Received: by 2002:a1c:2586:: with SMTP id
 l128mr14656403wml.149.1605531275647; 
 Mon, 16 Nov 2020 04:54:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJSLZrSksXfUd4OoNXtMWGsZHa8Enl1OvLzCVSdcy6d3FHTYbrw3tzAkzlAl7b64ydCufoOw==
X-Received: by 2002:a1c:2586:: with SMTP id
 l128mr14656374wml.149.1605531275447; 
 Mon, 16 Nov 2020 04:54:35 -0800 (PST)
Received: from redhat.com ([147.161.8.56])
 by smtp.gmail.com with ESMTPSA id f17sm19651203wmh.10.2020.11.16.04.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:54:34 -0800 (PST)
Date: Mon, 16 Nov 2020 07:54:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116075151-mutt-send-email-mst@kernel.org>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
 <20201111143615.GA1421166@stefanha-x1.localdomain>
 <20201111154850.GG906488@redhat.com>
 <20201116111524.GD96297@stefanha-x1.localdomain>
 <20201116124858.epiz322osx753plo@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20201116124858.epiz322osx753plo@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 01:48:58PM +0100, Gerd Hoffmann wrote:
> > > In validating QEMU migration compatibility we merely compare the
> > > versioned machine type.
> > 
> > Thinking more about this, maybe the big picture is:
> > 
> > Today the managment tool controls the variables in the migration (the
> > device configuration). It has knowledge of the VMM, can set a machine
> > type, apply a device configuration on top, and then migrate safely.
> > 
> > VFIO changes this model because VMMs and management tools do not have
> > knowledge of specific device implementations. The device implementation
> > is a new source of variables in the migration and the management tool no
> > longer has the full picture.
> 
> Well.  We actually have the variables.  They are device properties.
> Then the qemu compat properties basically map a machine type to a
> set of device properties.  That way we hide the complexity inside
> qemu.  The management apps have to deal with the (versioned) machine
> type only.
> 
> I guess now we have to decide whenever we want expose the individual
> variables or whenever we want something like "profiles", i.e. basically
> a set of variables with a name attached.
> 
> At the end of the day it is a complexity vs. flexibility tradeoff ...
> 
> take care,
>   Gerd

BTW it's not too bad if, for starters, we are doing exactly what we are
used to be doing, just ask vendors to supply the list all variables and
include it in the QEMU code. Has a benefit of limiting our support
matrix so we can make initial protocol changes with reasonable certainty
they do not break devices.  Once number of supported devices grows we
can think of sane ways to relax that...

-- 
MST


