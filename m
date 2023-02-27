Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED246A4860
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:43:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhWu-00056x-ED; Mon, 27 Feb 2023 12:43:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pWhWt-00055F-0C
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:43:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pWhWr-0001w7-Cs
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:43:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677519792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWvPgtwYvmCu8lOK4nwUtQNkqKH9shUh3jAzAL9nRjo=;
 b=Oeei5fJDjhxqfy7naBixtKcg/mM6tQln8nfUmU8wpkDfm5VVFpugh5eTp2xMg2TWOcU8gB
 fJXR0lmtBoSOodxZh8Ow/R/BVyQl3f0Aua6m9rGEFqf+klFrtc8CYqEezsOFRMlWNI7eAi
 ghvPncQg+X7Kid/9B7V/Es/s3vu1b/Q=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-A0CF6XnRPKyHCH-qgnv6gg-1; Mon, 27 Feb 2023 12:43:11 -0500
X-MC-Unique: A0CF6XnRPKyHCH-qgnv6gg-1
Received: by mail-il1-f198.google.com with SMTP id
 v3-20020a92c6c3000000b003159a0109ceso4413333ilm.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oWvPgtwYvmCu8lOK4nwUtQNkqKH9shUh3jAzAL9nRjo=;
 b=0Nc2XYwGRCtiCE20UKvmO1KQ+oB1arsjSwybeol2ffXZ/qcbiRF4KS/PQVOC9pJKB2
 Cpi033dNkpI6zxU/hQLv/gEyLsPm9BFe+2j2Oe8ie7xAhru2Zsd4Hi9iSyZX+A0gyAlf
 nMOtVFGaZjDshKIjLujDkdkeSMAQyp6eoKMcgNn8vfohIY/oHEeP/QL3wdlgar6/eZpH
 8RdlbF7CBE7QsNE3SXRcojP0zRTRuV4oaOlwp+/wcQUGwVlBJOK3Pqj0QPLRmKG51Qmk
 AysU0IhOdz4bRa58VfNbTwgkyN8dawkSc6FbfwWamedEn696Cf5hjcAGbDtx7m9xSRq4
 FVwg==
X-Gm-Message-State: AO0yUKWeelPb0hLJ/id/P8ngJ2MhUhYgpP3uygVgW6n7EEmFB2kURa7D
 6wmzdZiJU17rf2NzB53me8Zr3FQNDjO9t7Ux5Bd0QPDBsWW+7+8OsZz1fwH+gTi6ZiXL6JDNOrJ
 cFIGFPa0OC5ONM5Q=
X-Received: by 2002:a05:6e02:1bcf:b0:317:641e:1088 with SMTP id
 x15-20020a056e021bcf00b00317641e1088mr237836ilv.19.1677519790600; 
 Mon, 27 Feb 2023 09:43:10 -0800 (PST)
X-Google-Smtp-Source: AK7set+6S9RLdl+DWXJ9bpXEbzVwC0dXlaMtdmv/+eUSXqAhbMH1M8o+HkYe+fu5z5g/ADuEDMoYgg==
X-Received: by 2002:a05:6e02:1bcf:b0:317:641e:1088 with SMTP id
 x15-20020a056e021bcf00b00317641e1088mr237810ilv.19.1677519790361; 
 Mon, 27 Feb 2023 09:43:10 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k6-20020a02a706000000b003c48d97bea7sm2246862jam.147.2023.02.27.09.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:43:09 -0800 (PST)
Date: Mon, 27 Feb 2023 10:43:08 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason
 Wang <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?=
 =?UTF-8?B?w6k=?= <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH v2 03/20] vfio/migration: Add VFIO migration pre-copy
 support
Message-ID: <20230227104308.14077d8a.alex.williamson@redhat.com>
In-Reply-To: <Y/znqJvtxtUEmsHi@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
 <20230222174915.5647-4-avihaih@nvidia.com>
 <20230222135811.705b85b7.alex.williamson@redhat.com>
 <38bdb26f-08d7-fe11-9a97-ebcc95c82254@nvidia.com>
 <20230223141637.67870a03.alex.williamson@redhat.com>
 <a875f6e5-951b-8f39-7867-313eabe54363@nvidia.com>
 <20230227091444.6a6e93cd.alex.williamson@redhat.com>
 <Y/znqJvtxtUEmsHi@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 13:26:00 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Feb 27, 2023 at 09:14:44AM -0700, Alex Williamson wrote:
> 
> > But we have no requirement to send all init_bytes before stop-copy.
> > This is a hack to achieve a theoretical benefit that a driver might be
> > able to improve the latency on the target by completing another
> > iteration.  
> 
> I think this is another half-step at this point..
> 
> The goal is to not stop the VM until the target VFIO driver has
> completed loading initial_bytes.
> 
> This signals that the time consuming pre-setup is completed in the
> device and we don't have to use downtime to do that work.
> 
> We've measured this in our devices and the time-shift can be
> significant, like seconds levels of time removed from the downtime
> period.
> 
> Stopping the VM before this pre-setup is done is simply extending the
> stopped VM downtime.
> 
> Really what we want is to have the far side acknowledge that
> initial_bytes has completed loading.
> 
> To remind, what mlx5 is doing here with precopy is time-shifting work,
> not data. We want to put expensive work (ie time) into the period when
> the VM is still running and have less downtime.
> 
> This challenges the assumption built into qmeu that all data has equal
> time and it can estimate downtime time simply by scaling the estimated
> data. We have a data-size independent time component to deal with as
> well.

As I mentioned before, I understand the motivation, but imo the
implementation is exploiting the interface it extended in order to force
a device driven policy which is specifically not a requirement of the
vfio migration uAPI.  It sounds like there's more work required in the
QEMU migration interfaces to properly factor this information into the
algorithm.  Until then, this seems like a follow-on improvement unless
you can convince the migration maintainers that providing false
information in order to force another pre-copy iteration is a valid use
of passing the threshold value to the driver.  Thanks,

Alex


