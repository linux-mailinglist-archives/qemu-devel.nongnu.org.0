Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C77D2B4354
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:09:10 +0100 (CET)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedJl-00071X-LD
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kedHK-0005JW-Rm
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kedHG-0005ID-GA
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605528393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1wvTmnJc+XPiZBk/RoWhQBfqbU4dMNqlLSm52uGg5CQ=;
 b=VFBYUd+FoRf0KB0spYNHotR7RVITWQ5+1OiBMSUnGv0MAyEpcxeAk+6N7+jpNZWTHPnHX4
 ZX4dwgzRRWeVY2KyTdbdI73IcwTfsdtm4r7IGPKgD06OnO41Nb3hzmCT5jiI4k+fKPezos
 vs0E+g89uQB0a9aQ19wFhgq2JQ6cLiA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-O9eHPa0hMAKrynEho6cDfA-1; Mon, 16 Nov 2020 07:06:31 -0500
X-MC-Unique: O9eHPa0hMAKrynEho6cDfA-1
Received: by mail-ed1-f69.google.com with SMTP id p24so1440564eds.7
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:06:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5SQGQ7kKRf848HHtFjrfhsHJkkrIuNOd6vrbHtMrn6E=;
 b=epI9QHKThAXt8hmeammVD7mSpHVD5gzO9dGiuEXhX5Vvq1hVgY2Sjs/1s24o4Lvv6W
 47otAkd47CpOU9V/G1Uf0GBizUvt3oL7TANBpN6towpQxJ1RR/TgdAAkRkVNEHamKEqo
 Myxn99njPIre+KvDGmUNaGqjZ3ltpNXafGojAkW1pQmrNL9o1S0w1sBnKx0lpaZ97QyD
 Nm1SOtLr3njyg52tQ+h9g9cjKxCvCkBNWy0ibmMazEkrhYj4fKTrECyMBgfx0NixeaGX
 eTT2UUXO6LyU72bqPT4CwfMH5wRK509WXMP1Dc+IGgskQ59kif0iLxE7X3tJ/9CWURDS
 7dag==
X-Gm-Message-State: AOAM532Fm1Bfqg2cDYrhGplfAWXiLCe6YFloz0yO0oc2qyoTCsi24W1j
 31AtF/XuIUjHQu9F+DusdCru6gOZxsd4yQU3IBgBZXuZhsPG42VXYqX4oHA1jPshdi3d23FO4BJ
 nUeYiaS2UxqOByi8=
X-Received: by 2002:a17:906:f753:: with SMTP id
 jp19mr13852594ejb.280.1605528390676; 
 Mon, 16 Nov 2020 04:06:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3YQb6BR8B5Zp/CnGEwiEVO4LXRDcTTGsbWo58WkaUNmTNEB1EUMmlz8tgj6MOoQ5LGw1Hsg==
X-Received: by 2002:a17:906:f753:: with SMTP id
 jp19mr13852583ejb.280.1605528390531; 
 Mon, 16 Nov 2020 04:06:30 -0800 (PST)
Received: from redhat.com ([147.161.8.56])
 by smtp.gmail.com with ESMTPSA id z13sm10265028ejp.30.2020.11.16.04.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:06:28 -0800 (PST)
Date: Mon, 16 Nov 2020 07:06:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201116070417-mutt-send-email-mst@kernel.org>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
 <20201111143615.GA1421166@stefanha-x1.localdomain>
 <20201111154850.GG906488@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111154850.GG906488@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Kevin" <kevin.tian@intel.com>, Yan Zhao <yan.y.zhao@intel.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 11, 2020 at 03:48:50PM +0000, Daniel P. Berrangé wrote:
> In terms of validation I can't help but feel the whole proposal is
> really very complicated.
> 
> In validating QEMU migration compatibility we merely compare the
> versioned machine type.
> 
> IIUC, in this proposal, it would be more like exploding the machine
> type into all its 100's of properties and then comparing each one
> individually.
> 
> I really prefer the simpler model of QEMU versioned machine types
> where compatibility is a simple string comparison, hiding the
> 100's of individual config parameters.  

I think we need to ship a tool with QEMU that handles this complexity.
If the tool spits out a very long string with all the needed parameters,
management won't need to care that it's not just a short
machine type.

-- 
MST


