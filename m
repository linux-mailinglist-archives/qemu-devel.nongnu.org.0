Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EE32BB062
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 17:28:46 +0100 (CET)
Received: from localhost ([::1]:60866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg9HB-00018U-1c
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 11:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg98T-0007zr-2L
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:19:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kg98L-0005DG-K5
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 11:19:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605889175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nxQjDlrH26zAGIYAerqsA7p/2/BkVZ9TYxONaukFpto=;
 b=i/8onI+iqJOFikntI9uaaFiTdLlmNXwM9n9hriCwgx+WejCJ3cklyJOLRN15qLlooOivDN
 Gc1hiuIKm++r395IoEVQu1mVK2x12K3YT8LbartkMVElxhST/Z9VdyS1HxBwlB2JJBn2AF
 g/cRfFRK6K3AYkmHjUwLomryqYeai0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-z1rO9EeFPJyLEhotFSsPrA-1; Fri, 20 Nov 2020 11:19:33 -0500
X-MC-Unique: z1rO9EeFPJyLEhotFSsPrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BA278145F1
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 16:19:32 +0000 (UTC)
Received: from localhost (unknown [10.40.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B3C15C233;
 Fri, 20 Nov 2020 16:19:29 +0000 (UTC)
Date: Fri, 20 Nov 2020 17:19:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v2 00/37] cleanup qemu_init and make sense of
 command line processing
Message-ID: <20201120171927.3179568e@redhat.com>
In-Reply-To: <13f14d6c-e52a-390c-7940-9df2e220113e@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201102165756.69540720@redhat.com>
 <6c08fbaa-57aa-b2da-c90a-6b53f628806a@redhat.com>
 <20201103135735.029c9b6d@redhat.com>
 <13f14d6c-e52a-390c-7940-9df2e220113e@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 3 Nov 2020 15:37:13 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 03/11/20 13:57, Igor Mammedov wrote:
> >> It's based on 20201026143028.3034018-1-pbonzini@redhat.com (which you
> >> should be able to get through patchew).  
> > Not sure what you mean and how to do that.
> > Is it possible to share v2 as a git tree somewhere?  
> 
> I pushed it to for-6.0 on my gitlab repo.  There's a lot more stuff in
> the branch, but these patches are at the top.

had to use temporary fixup, to make build pass and fix '-device help' crash
with your branch. (upstream master doesn't have this problem)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 858860377b..78f3397736 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -776,6 +776,7 @@ static const char *get_opt_name_value(const char *params,
         /* found "foo,more" */
         if (help_wanted && starts_with_help_option(params) == len) {
             *help_wanted = true;
+            return NULL;
         } else if (firstname) {
             /* implicitly named first option */
             *name = g_strdup(firstname);

> 
> Paolo
> 
> 


