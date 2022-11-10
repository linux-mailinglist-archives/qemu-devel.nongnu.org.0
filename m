Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A11624268
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 13:34:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6k4-0007Qh-Uc; Thu, 10 Nov 2022 07:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot6k2-0007QB-7y
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:33:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ot6k0-00085Y-KH
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 07:33:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668083586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kyfUvfeAqc7RhCbw0IBEANzjvbiIkQVNeR7CRIJHfIA=;
 b=OCywziMozz2yBeRoJrMgPJNTRvDXeH3exbJGwlghi+ar+rj8RWjXerJl/vb6C6UM8CHv9d
 hRwP0JdTrX0Ak3VF85c5ergnIVyOnuIAek2qKlDe3Q6fl2BL9neHAUqtPMbQJwDDPVsoIz
 6D8jZc5UdNK9iXqdvnctkHIzI97EgD4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-DU-cYO9yP9CYNoSSgYUWjQ-1; Thu, 10 Nov 2022 07:33:03 -0500
X-MC-Unique: DU-cYO9yP9CYNoSSgYUWjQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2FDF38173D2;
 Thu, 10 Nov 2022 12:33:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92E7A2023A16;
 Thu, 10 Nov 2022 12:33:01 +0000 (UTC)
Date: Thu, 10 Nov 2022 13:33:00 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: Re: [PATCH for-7.2 4/5] iotests/151: Test that active mirror
 progresses
Message-ID: <Y2zvfNAV8T1dhXhq@redhat.com>
References: <20221109165452.67927-1-hreitz@redhat.com>
 <20221109165452.67927-5-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109165452.67927-5-hreitz@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Am 09.11.2022 um 17:54 hat Hanna Reitz geschrieben:
> Before this series, a mirror job in write-blocking mode would pause
> issuing background requests while active requests are in flight.  Thus,
> if the source is constantly in use by active requests, no actual
> progress can be made.
> 
> This series should have fixed that, making the mirror job issue
> background requests even while active requests are in flight.
> 
> Have a new test case in 151 verify this.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>


