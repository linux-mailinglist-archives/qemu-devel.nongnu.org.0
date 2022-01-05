Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB1E485BF7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 23:58:05 +0100 (CET)
Received: from localhost ([::1]:49818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5FEK-00026f-G4
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 17:58:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5FCz-0001Gg-Jm
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5FCw-0001o4-Ok
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 17:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641423397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V6m8u3gzEN+5Gs0rFxJGhSiVfAzF8qa8gCDneBudXU0=;
 b=Ju9voTe1r4JGyzXovTtI6Sc5Zn88p0+tTmmkqqCY0GI1+QstbjPzgKshQgvbOYqWL9KfOb
 i0Ci+jyea3ZcgCl4tSo+/x3CzyqNwhoUOG6iX4p3ALITMMccf7Jtpr930+KSUAdWegRVJl
 OnJFigYSna95QbEmw9kPwCBVB/K49gY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-4QzSLLWPOzyjZ-6qiv5eJw-1; Wed, 05 Jan 2022 17:56:31 -0500
X-MC-Unique: 4QzSLLWPOzyjZ-6qiv5eJw-1
Received: by mail-wr1-f71.google.com with SMTP id
 w25-20020adf8bd9000000b001a255212b7cso308220wra.18
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 14:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=V6m8u3gzEN+5Gs0rFxJGhSiVfAzF8qa8gCDneBudXU0=;
 b=D85TK2pLxBRLggj4TAhajLfDnPPDdNMuZ2Lp79xWLBBBzCkod7UfwrWNwbuYSKwH5f
 5QZzTFuCyyF2LGdsAds6CIYh0HFYKeE3/S4VgYF1xGmTGzSfVV30rndxPbovM0g8ALUk
 brzwIXgT7dUSYsKn92/8BlZQ4bP8bRpCJ9Alz4tozsZNWDnCwiljDyx23dOwq2BPThIK
 llmobyL1QjfFo+IJYGAwklbwy+gVGWvWzuWgmB9d4p9DYPxqw9PYmWXyR73HKb0rSJG6
 lpUxZ3xKycuNjCvdZ8iFVaZfOgd8ph85QmySTPhgqsAs6bG+QK22NT3rOVUOfgV9jAu7
 cFzg==
X-Gm-Message-State: AOAM5319Xw5pq+z7ZHdhljIA+H4v+V49zPfLfHDfNLQCwc33KDNQ8BfP
 j09HGspYz3IcQBuKJay/yoDll6Ht5ZTprHq5FO1tPUuKnopswR0QOqY/XpBrkgGaSF/F5xosUzX
 ywfjlJuRgqRWu9N0=
X-Received: by 2002:a7b:c7d0:: with SMTP id z16mr4740049wmk.76.1641423390246; 
 Wed, 05 Jan 2022 14:56:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw6GS056LJrsFPlX+DWzR8kOeOYzSJU+SzRdhlUHdc4WnX+EscgIicaxJi8rPTXUjW1xh071w==
X-Received: by 2002:a7b:c7d0:: with SMTP id z16mr4740039wmk.76.1641423390058; 
 Wed, 05 Jan 2022 14:56:30 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id r9sm284494wrm.76.2022.01.05.14.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 14:56:29 -0800 (PST)
Date: Wed, 5 Jan 2022 17:56:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] qemu_fw_cfg: use default_groups in kobj_type
Message-ID: <20220105175546-mutt-send-email-mst@kernel.org>
References: <20220105183133.2812848-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20220105183133.2812848-1-gregkh@linuxfoundation.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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
Cc: Gabriel Somlo <somlo@cmu.edu>, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 07:31:33PM +0100, Greg Kroah-Hartman wrote:
> There are currently 2 ways to create a set of sysfs files for a
> kobj_type, through the default_attrs field, and the default_groups
> field.  Move the firmware qemu_fw_cfg sysfs code to use default_groups
> field which has been the preferred way since aa30f47cf666 ("kobject: Add
> support for default attribute groups to kobj_type") so that we can soon
> get rid of the obsolete default_attrs field.
> 
> Cc: Gabriel Somlo <somlo@cmu.edu>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

OK then you know best I guess

Acked-by: Michael S. Tsirkin <mst@redhat.com>

feel free to queue.

> ---
>  drivers/firmware/qemu_fw_cfg.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
> index 172c751a4f6c..c62f05420d32 100644
> --- a/drivers/firmware/qemu_fw_cfg.c
> +++ b/drivers/firmware/qemu_fw_cfg.c
> @@ -395,7 +395,7 @@ static void fw_cfg_sysfs_cache_cleanup(void)
>  	}
>  }
>  
> -/* default_attrs: per-entry attributes and show methods */
> +/* per-entry attributes and show methods */
>  
>  #define FW_CFG_SYSFS_ATTR(_attr) \
>  struct fw_cfg_sysfs_attribute fw_cfg_sysfs_attr_##_attr = { \
> @@ -428,6 +428,7 @@ static struct attribute *fw_cfg_sysfs_entry_attrs[] = {
>  	&fw_cfg_sysfs_attr_name.attr,
>  	NULL,
>  };
> +ATTRIBUTE_GROUPS(fw_cfg_sysfs_entry);
>  
>  /* sysfs_ops: find fw_cfg_[entry, attribute] and call appropriate show method */
>  static ssize_t fw_cfg_sysfs_attr_show(struct kobject *kobj, struct attribute *a,
> @@ -454,7 +455,7 @@ static void fw_cfg_sysfs_release_entry(struct kobject *kobj)
>  
>  /* kobj_type: ties together all properties required to register an entry */
>  static struct kobj_type fw_cfg_sysfs_entry_ktype = {
> -	.default_attrs = fw_cfg_sysfs_entry_attrs,
> +	.default_groups = fw_cfg_sysfs_entry_groups,
>  	.sysfs_ops = &fw_cfg_sysfs_attr_ops,
>  	.release = fw_cfg_sysfs_release_entry,
>  };
> -- 
> 2.34.1


