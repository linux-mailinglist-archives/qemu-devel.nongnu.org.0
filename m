Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D27733A27CF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 11:08:55 +0200 (CEST)
Received: from localhost ([::1]:34624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGgI-0006vV-VF
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 05:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGfD-00067Q-Pq
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lrGfB-0006kx-KP
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 05:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623316064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HwnnEuQIdbjP6IeNmDtKDyNDGctG59t9rVmjscRMrfY=;
 b=O+MkO0Qv5pgKxc0mwXQpMucFadrxOjYJ3D4GcueoOF3Auv8JTwVzBBVBOaNQS60hdL81m7
 cS7akOeY+n4zkYb/AlxuIfkt2tWeal9IQG7a+5q9Jvn2NAbliQsodp+/SnByHItyujq1Ew
 WrjdI9wsT6kKF2kJ+fyQT2bzV5pzpyQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-rKo_bwLwPTKhUPngh32Dog-1; Thu, 10 Jun 2021 05:07:43 -0400
X-MC-Unique: rKo_bwLwPTKhUPngh32Dog-1
Received: by mail-wr1-f70.google.com with SMTP id
 n4-20020a5d42040000b0290119fef97609so570602wrq.18
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 02:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HwnnEuQIdbjP6IeNmDtKDyNDGctG59t9rVmjscRMrfY=;
 b=mncMam/FE3fo6wLLgXYmaYJxZZem5HH0Zv0SWdPTjyMujNbkw1n3Mv6LB/bCLw+zpP
 7XyslBuENFhEHMhw+dPHenK1sflfp4/AZX82oO+vTmo2M6RQHy7O0D7tnumAFp4j+3nn
 a63ad4uo+WG7o9QKZD+6PoYY6j9vh9AwcGPLA09BXaj/sNAVTAQ7Zf8N75pujP+ikCMA
 jkkyMERLQDWtrI948Q22csmtQtG0mKV+GCbB3bngR+tAng8FiopzwTeRjbG2/E5C42VI
 UE265aXNi9gOPbPT/yMg4FPI9w/8KEloEA/McjQUFeYDiQRo3WBWzgxEfc+xABH4XVyu
 BdMA==
X-Gm-Message-State: AOAM531P5hSa9hfvOuysard00Ud7CV0GF0VPa4GYnEdrpUjMxdZZgshr
 SEF3XUARQ5hBvqtqbyrJmbYqvUKYWHdVynGX/qR6dr+S8D6Y0JDlFt1yvgQn/YGkzGchSTmESgp
 /VYcM3TXFrA/WgUY=
X-Received: by 2002:a5d:530c:: with SMTP id e12mr4183674wrv.165.1623316062468; 
 Thu, 10 Jun 2021 02:07:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS6VsYa08EC0O5+FfXQPFEyU4CaRZGil1tXc8KFr0s7hI+c8tcWBcIAxaBB+uZVAdau5LHEg==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr4183651wrv.165.1623316062272; 
 Thu, 10 Jun 2021 02:07:42 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id y189sm2359893wmy.25.2021.06.10.02.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 02:07:41 -0700 (PDT)
Date: Thu, 10 Jun 2021 11:07:39 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/7] vhost: Distinguish errors in vhost_backend_init()
Message-ID: <20210610090739.fwexdxymcq7pnpfw@steredhat>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-3-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210609154658.350308-3-kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:46:53PM +0200, Kevin Wolf wrote:
>Instead of just returning 0/-1 and letting the caller make up a
>meaningless error message, add an Error parameter to allow reporting the
>real error and switch to 0/-errno so that different kind of errors can
>be distinguished in the caller.
>
>Specifically, in vhost-user, EPROTO is used for all errors that relate
>to the connection itself, whereas other error codes are used for errors
>relating to the content of the connection. This will allow us later to
>automatically reconnect when the connection goes away, without ending up
>in an endless loop if it's a permanent error in the configuration.
>
>Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>---
> include/hw/virtio/vhost-backend.h |  3 ++-
> hw/virtio/vhost-backend.c         |  2 +-
> hw/virtio/vhost-user.c            | 41 ++++++++++++++++---------------
> hw/virtio/vhost-vdpa.c            |  2 +-
> hw/virtio/vhost.c                 | 13 +++++-----
> 5 files changed, 32 insertions(+), 29 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


