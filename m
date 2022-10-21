Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E4A607492
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:58:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloni-0003AQ-2C
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:58:50 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olobp-00025B-UB
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1olobW-0000ob-2o
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:46:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1olobJ-0001cW-FG
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 05:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666345560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eEGcZTM4WGU313KAHF7BktRa/ucp0erVUqcUHAPhuxs=;
 b=J+S5JpWdPK/DM4DMgPQv94PvV8MwCwlZ1qila7ySrmcXovIRJmrx8ZrNzvJov1qXDoesOS
 D6hc/NsY1SdO7QNj4qGJB85V71qNBYT3hD4W0JMxfPI+qJTlEoNHHjrineWI6PNW/xIT9m
 qOhxgQbbmyy/FEwj+MpNM5xyX7msqEs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-360-r4VLegGdPdyvGdnfNvixeA-1; Fri, 21 Oct 2022 05:45:57 -0400
X-MC-Unique: r4VLegGdPdyvGdnfNvixeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B089D8339CB;
 Fri, 21 Oct 2022 09:45:56 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 008C32024CBF;
 Fri, 21 Oct 2022 09:45:55 +0000 (UTC)
Date: Fri, 21 Oct 2022 11:45:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>
Cc: hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/2] Fix some problems with vvfat in R/W mode
Message-ID: <Y1JqUvv7hRIKQipt@redhat.com>
References: <20221010175511.3414357-1-hpoussin@reactos.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010175511.3414357-1-hpoussin@reactos.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.10.2022 um 19:55 hat Hervé Poussineau geschrieben:
> Hi,
> 
> When testing vvfat in read-write mode, I came across some blocking
> problems when using Windows guests.
> This patchset is not here to fix all problems of vvfat, but only the
> main ones I encountered.
> 
> First patch allows setting/resetting the 'volume dirty' flag on
> boosector, and the second one allows creating file names with spaces.
> 
> Hervé
> 
> Changes since v1:
> - updated patch 1 with remarks (modify in-memory copy, add comment about
>   FAT32)

Thanks, applied to the block branch.

Kevin


