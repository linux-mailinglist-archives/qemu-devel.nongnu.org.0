Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE3933898E
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:02:48 +0100 (CET)
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKed5-0006PP-ID
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lKeYs-0004YL-H9
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:58:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lKeYp-0000na-Pm
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:58:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j/jep6r4fhcJbdNKUY/3DZPyIkCPpwWNfJTKNpaIcyI=;
 b=XFIK1mxdiJYRa99v5BkJIaAvyEIWWrITAXweAew/BsLKX27pu3OLdMtJca6pmPUz4dTcqD
 lzM9wCnQ2hsJF/9OK2mAvV3iQufqrBoSBDHhTjA7g+72pGXuiVWIdA8EAmJE16XHUNreB+
 FeMJF774bkkhkCpbS3nmZA6mwe67aMo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-31_Gss0ZMfmyo_08URB9GA-1; Fri, 12 Mar 2021 04:58:20 -0500
X-MC-Unique: 31_Gss0ZMfmyo_08URB9GA-1
Received: by mail-wr1-f70.google.com with SMTP id e13so10912721wrg.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:58:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j/jep6r4fhcJbdNKUY/3DZPyIkCPpwWNfJTKNpaIcyI=;
 b=YWBsne7tKnzJ+Z6PRKgXzyeD+2frezc4tlawuIVaicG2a6Qax5E2Ew8aAbvuyKVqmw
 sK6XPsm6G/U8ZYGVs//qtPsZFPm6cDII2culou/swOiyrCevEsopoFfuQ5WVeqfbJH/A
 clW7kZsCdONFpBiDCZ8iJGs9wIgIMHDPLGz97J/5lCMdiCZF+ecfWjpDKLTLELZGBU6f
 ojYMNwcQgkJkCxWRQdseqxNM7jwM+2/2ES8uG03uVo0wCEUlCIunK0kWFiRe7oKNuQRv
 H5mMOFaixjRIYWyfyIHm4tr+KEkgu1pho48wWPuUNy14NBRwOv0EHqGV5+EVEL+8Ey48
 q2cg==
X-Gm-Message-State: AOAM533a95TIMcMxpjfbMBuaKWWb/fwYHAaldk8ChCsitZ4VYBMmbu9L
 oJDVUsm1SdbocqD+NHyP5tLBKlLukkf+TDP1LJCVEvBX6p+WU2nUrL2X7XcaWov6TUdC7X0w+GF
 FOduHyG18fmHedrc=
X-Received: by 2002:adf:a2d3:: with SMTP id t19mr13010270wra.299.1615543099598; 
 Fri, 12 Mar 2021 01:58:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDO4kJdgK66RmqvQ0705ZGvPPepS6G2jySR6AnSbTHnBojJpHFydHGGMjkFyEkG1/1ftpR2w==
X-Received: by 2002:adf:a2d3:: with SMTP id t19mr13010259wra.299.1615543099375; 
 Fri, 12 Mar 2021 01:58:19 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id 3sm8304150wry.72.2021.03.12.01.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:58:19 -0800 (PST)
Date: Fri, 12 Mar 2021 10:58:17 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/7] vhost: replace master/slave with more accurate
 wording
Message-ID: <20210312095817.yctikaqtienzcnhq@steredhat>
References: <20210311103250.532191-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210311103250.532191-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 11, 2021 at 05:32:43AM -0500, Paolo Bonzini wrote:
>Compared to v1, which only affected the prose of the documentation, I
>am also changing the message names in the docs and code now.
>
>Patch 2 was also adjusted according to Stefan's documentation, and
>"frontend/backend" (with no hyphen) is used consistently.

A few "Back-end[s]" words (hyphenated, maybe those with a capital B) 
remained in the patch 3.
If you don't have to respin the series, I can send a followup patch if 
you want.

Anyway the series LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


Thanks,
Stefano


