Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EC9392195
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:43:55 +0200 (CEST)
Received: from localhost ([::1]:45230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm0Ne-0001Px-3N
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lm0Ke-0008V3-JV
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:40:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lm0KY-0002kO-FA
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:40:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622061639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VnHwBzP8a76nTLBoNIbrjlBOWwnDHSox7U2dnAAiPDE=;
 b=gGZBdmI26ZhbW5kNGyOMtwpGwIhI8yjdud8K7yIpfu/7fCSBocowDa0H+L+rM8Vk4e06vC
 cOvapUl/DVwSxrVCYY6/3DuJT5XvS8bSwrn24AxrvBRXrehbvCM3BD5PwY+gzcCFuY99Fk
 r8Oe7xI/2MJd6zSThPNpHCJ2wnV3GqQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-vfMe8LL-N3G4luQgdLduxw-1; Wed, 26 May 2021 16:40:37 -0400
X-MC-Unique: vfMe8LL-N3G4luQgdLduxw-1
Received: by mail-qk1-f200.google.com with SMTP id
 s123-20020a3777810000b02902e9adec2313so1780653qkc.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 13:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VnHwBzP8a76nTLBoNIbrjlBOWwnDHSox7U2dnAAiPDE=;
 b=YcNFISYtSoQyJLSs9oiWIZH2VaCWoH4WgEXq/1kL776BDHW1DPcinp4czUXYQIZse5
 7SpL0WALJfc3/zdqJnOkD9FfosXGAH6SYDKryHiuiXZTdiX8UtAEGxgRPhL2JYi6/uzE
 o06xei7pQ/WKdHpvH6Gk0ssS00CcGtOvqKYOcleZWONZhmIgvLJW87MqLIscjcUjaDE4
 yf+zVp341rBHZVcML4DvM8nc9FGsANfvM88jyBMP8onbXrSWFOoK/sAh8dkKUpLyiQrj
 W+fUPxFz1pby3cPFckQCf/+5I0tvtzfWseXsrSDiff94BFxY4Xn89KwBgRy3ICz/0YqC
 9O9w==
X-Gm-Message-State: AOAM532CO2y7aU3VnUBzEk9ks5X15X932JWotinm6lB3dClgAi7EJoHj
 uSE14goJjjJ8Zf9ULns8Q66WmtNM/MFi58pga/W2xPsSrzAqU23ocl/CcVUyIrmoO3YdRp6E4P1
 HxgibnAFc23bbOmc=
X-Received: by 2002:ad4:4c45:: with SMTP id cs5mr45496848qvb.6.1622061637259; 
 Wed, 26 May 2021 13:40:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC4lCym8Ns+PiFZIV3l+sFX3/AmQOrVi8vU7Lv3aBXYyouEOAyn36SE2NghQQAJB9Qn2k2aw==
X-Received: by 2002:ad4:4c45:: with SMTP id cs5mr45496828qvb.6.1622061636981; 
 Wed, 26 May 2021 13:40:36 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca.
 [184.145.4.219])
 by smtp.gmail.com with ESMTPSA id 20sm18327qks.64.2021.05.26.13.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 13:40:36 -0700 (PDT)
Date: Wed, 26 May 2021 16:40:35 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras <leobras.c@gmail.com>, lukasstraub2@web.de
Subject: Re: [PATCH 1/1] yank: Unregister function when using TLS migration
Message-ID: <YK6yQ9EVNlVPDMaS@t490s>
References: <20210526200540.1088333-1-leobras.c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210526200540.1088333-1-leobras.c@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: qemu-devel@nongnu.org, lukasstraub2@web.de,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 05:05:40PM -0300, Leonardo Bras wrote:
> After yank feature was introduced, whenever migration is started using TLS,
> the following error happens in both source and destination hosts:
> 
> (qemu) qemu-kvm: ../util/yank.c:107: yank_unregister_instance:
> Assertion `QLIST_EMPTY(&entry->yankfns)' failed.
> 
> This happens because of a missing yank_unregister_function() when using
> qio-channel-tls.
> 
> Fix this by also allowing TYPE_QIO_CHANNEL_TLS object type to perform
> yank_unregister_function() in channel_close() and multifd_load_cleanup().
> 
> Fixes: 50186051f ("Introduce yank feature")
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1964326
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Leo,

Thanks for looking into it!

So before looking int the fix... I do have a doubt on why we only enable yank
on socket typed, as I think tls should also work with qio_channel_shutdown().

IIUC the confused thing here is we register only for qio-socket, however tls
will actually call migration_channel_connect() twice, first with a qio-socket,
then with the real tls-socket.  For tls I feel like we have registered with the
wrong channel - instead of the wrapper socket ioc, we should register to the
final tls ioc?

Lukas, is there a reason?

-- 
Peter Xu


