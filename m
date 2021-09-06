Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F96401CA7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 15:52:06 +0200 (CEST)
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNF2b-0007mI-3D
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 09:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNExp-00019E-Fl
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:47:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mNExl-0003y8-Sp
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 09:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630936024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+jv88y3wn04J6iv6rz1NQuneOFNu8bE+rZJlMvWPHIQ=;
 b=i2HcAnGaCEFjMII9XIBwum+5OVafzm6ebImZKRJS/sHo3udnclDYcjQbyOj2rf2T6lFFo7
 qSvz1K8m5HnxtrP6fg0ZD/1SgbEZzPIqR6J/PJd0KGn0VlEUbnZtJi+US9gYqmQZtu2ZPg
 zD6AUxqaxGgV9TVFYaGhuytzpDQHkN8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-MOqcnRfMPvy0PqDnUPR3gw-1; Mon, 06 Sep 2021 09:47:03 -0400
X-MC-Unique: MOqcnRfMPvy0PqDnUPR3gw-1
Received: by mail-ed1-f70.google.com with SMTP id
 s15-20020a056402520f00b003cad788f1f6so3532584edd.22
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 06:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+jv88y3wn04J6iv6rz1NQuneOFNu8bE+rZJlMvWPHIQ=;
 b=iEDgebU1xofI2ZAvHRT7cLzF3xbhKuWwJ1CQolq7+QT2aVd2fK5PCsGHDiKHhZtF7Q
 BkzIwPHY+KRMt/jO9ajBD+vIYWBL7S8d80qXnadgl+ztvVzuGmlttmFlXB6PVpqs2ZbE
 o7O9WqEcdLj0qsqwJBLGn9kiuP1kiLOizATrivsUqIEVESLx29YcQrWeADckZ6s74qlK
 TvgrrSIP/kKdUpf/Y9SwDebZMFYXH/a22XOhKwN0xq/A4MNoRsRza3y8kl8BqIHRWFAf
 dZk61Mn9bLxzzwTvhuAHBIUnZWJDfvYg8dWVcQECKguP/023IcQI6layANhDfsWVxY0J
 xSPA==
X-Gm-Message-State: AOAM532f1Rk6n0VhjYQPt+69j1mKwY7pmam3508mhodfvTW7k28Kq05Z
 LlgDaY2PYe/7VrKGeALsRNSSiic9dBH7W8ykaFXR2TBn0M3lPnFgf0ig6SnydBGwQylW9FTdDf3
 uunF35KuQCQPD1+8=
X-Received: by 2002:a17:906:3b99:: with SMTP id
 u25mr13346950ejf.101.1630936021962; 
 Mon, 06 Sep 2021 06:47:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIKju7RbC7k2s6+bj90i/HO2kwj49aosIMjLOH6mD0Xk2ErX2er3IRWYVOHivSwJ2LG+GV2w==
X-Received: by 2002:a17:906:3b99:: with SMTP id
 u25mr13346926ejf.101.1630936021743; 
 Mon, 06 Sep 2021 06:47:01 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id b12sm4777291edy.36.2021.09.06.06.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 06:47:01 -0700 (PDT)
Date: Mon, 6 Sep 2021 15:46:59 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 0/2] iothread: cleanup after adding a new parameter to
 IOThread
Message-ID: <20210906134659.g23tm2njoseyimiq@steredhat>
References: <20210727145936.147032-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210727145936.147032-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping :-)

Looks like it went into the crack during feature freeze,
should I resend it?

On Tue, Jul 27, 2021 at 04:59:34PM +0200, Stefano Garzarella wrote:
>We recently added a new parameter (aio-max-batch) to IOThread.
>This series cleans up the code a bit, no functional changes.
>
>Stefano Garzarella (2):
>  iothread: rename PollParamInfo to IOThreadParamInfo
>  iothread: use IOThreadParamInfo in iothread_[set|get]_param()
>
> iothread.c | 28 +++++++++++++++-------------
> 1 file changed, 15 insertions(+), 13 deletions(-)
>
>-- 
>2.31.1
>
>


