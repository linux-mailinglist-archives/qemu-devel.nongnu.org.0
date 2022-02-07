Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A444AC62F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:43:12 +0100 (CET)
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH76d-0005CR-7N
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:43:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH71A-0001bD-70
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:37:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH70y-000582-C5
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644251810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cD2ICVQm5+vRQM8Lr8gc0c0e+y1M4//6+n7eW+BoeiM=;
 b=Lj3JQFvER2AJ0xEZY67J4tSPgJlzwII6mQn0VsNPyVc2hDKqexrAJfGVTv6NK4d8ZWVb+i
 89+w0MOOlpNPZTfpkrF1Pt7D4u/K4xuXP5cMpjdwAj9jiPYhb5z7YdHA0B50iYaHcwpBml
 Jag2XwtBo7QLsbOeedRBMNJLpRqKjGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-U-tNvIPHPsOne_BQNu_alQ-1; Mon, 07 Feb 2022 11:36:46 -0500
X-MC-Unique: U-tNvIPHPsOne_BQNu_alQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C73C31054F90;
 Mon,  7 Feb 2022 16:36:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9A9C7CD70;
 Mon,  7 Feb 2022 16:36:44 +0000 (UTC)
Date: Mon, 7 Feb 2022 17:36:43 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] block/vvfat: Fix memleaks in vvfat_close()
Message-ID: <YgFKmxCFDz4202mT@redhat.com>
References: <20220207113716.31400-1-hreitz@redhat.com>
 <e427f465-81f4-8a2c-ddc5-602d891ad3fe@amsat.org>
MIME-Version: 1.0
In-Reply-To: <e427f465-81f4-8a2c-ddc5-602d891ad3fe@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.02.2022 um 16:20 hat Philippe Mathieu-Daudé geschrieben:
> On 7/2/22 12:37, Hanna Reitz wrote:
> > qcow_filename and used_clusters are allocated in enable_write_target(),
> > but freed only in the error path of vvfat_open().  Free them in
> > vvfat_close(), too.
> > 
> > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> > ---
> >   block/vvfat.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/block/vvfat.c b/block/vvfat.c
> > index b2b58d93b8..811ba76e30 100644
> > --- a/block/vvfat.c
> > +++ b/block/vvfat.c
> > @@ -3213,6 +3213,8 @@ static void vvfat_close(BlockDriverState *bs)
> >       array_free(&(s->directory));
> >       array_free(&(s->mapping));
> >       g_free(s->cluster_buffer);
> > +    g_free(s->qcow_filename);
> > +    g_free(s->used_clusters);
> 
> Previously posted / reviewed :)
> 
> https://lore.kernel.org/qemu-devel/20210430162519.271607-2-philmd@redhat.com/
> https://lore.kernel.org/qemu-devel/20210430162519.271607-3-philmd@redhat.com/

Looks like there were questions about patch 3 and even an objection to
patch 4. Do you suggest we apply only the first two patches? I think at
the time I expected you would either reply or send a v2.

Kevin


