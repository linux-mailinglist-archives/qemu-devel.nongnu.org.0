Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71CD3D15F5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 20:13:44 +0200 (CEST)
Received: from localhost ([::1]:60308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Gj1-0005Tu-P3
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 14:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Ghx-0004oY-Ie
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 14:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Ghv-0000Ev-8l
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 14:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626891154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u/9UedNvs3WymrONOG3y6LsrKvyD9TO7MDuWQFTreC4=;
 b=hoK5UGzbpS+8tHElfnNEscxJBC17Do2LQMOarVSzMfr2W89cx1Y9UCKKOY3N43tiqQ6ehv
 989L5oJocErINhHV69KEloqrLFLW3CLpM29QSk/F/P/fMuXmDz45Mxisr+CqOwmt/k8+Xo
 ThHn4iesfsSkOmGrVGHiCA3nbc93OJE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-34awDqHGN8q4vcrF02E7Xw-1; Wed, 21 Jul 2021 14:12:32 -0400
X-MC-Unique: 34awDqHGN8q4vcrF02E7Xw-1
Received: by mail-qv1-f72.google.com with SMTP id
 x18-20020ad440d20000b02902e121b2b364so2104662qvp.12
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 11:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u/9UedNvs3WymrONOG3y6LsrKvyD9TO7MDuWQFTreC4=;
 b=n8+LhKp/ez4iX5mb4OhWAa+oi+nrZHyBGTksu7UD6uS+WvOrnldPa4FRZRrJcD4mG0
 NbLdkCLUXVecBfhnxDt8foTPUNH8S+xo8O6B73+QZ2cqW/5xwmxE4wa9XaAtl4yyUqNg
 UJHpyET4MMMko0Fw+liWy+QfjtYeBcpQ9ZYcLhrNdS89aIdUyFIWGFTyXI9F/kLVCSZx
 3blr5ncbaUzEmhQ5f1MYu46C2zh8ewWJb1WPt1WKT3kG/LbOHmjgruVr6Y/pJ1wA4py0
 sjxpm20AJx8QsJlRWYVWuKsB6CV2Zl2+BM2ytZ0I/RRiGnPIlPxAO5451w0Jiy8ibnRr
 DFAw==
X-Gm-Message-State: AOAM532ffMCuX47SKgn8UhAaT6mW2NRXf0aze8oliV8n1L7B/Ck7YVNr
 pjnvN0Bz+CJfSQXfj99hNkBEAo3uwHM9bDYOJ5urwnhF6faKjPXEppeBU2rJ4ArDj1m5SRK40OL
 YhWtPI2S97mBrWak=
X-Received: by 2002:ac8:4810:: with SMTP id g16mr11895050qtq.149.1626891152478; 
 Wed, 21 Jul 2021 11:12:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6QsniLHYi+G4haLRrFOIHAtdewoomvUWl8LLxDT150ZG5Jcrokp7/6Caqxl0GzYjAfwfxPA==
X-Received: by 2002:ac8:4810:: with SMTP id g16mr11895033qtq.149.1626891152245; 
 Wed, 21 Jul 2021 11:12:32 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id v2sm1431215qtq.42.2021.07.21.11.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 11:12:31 -0700 (PDT)
Date: Wed, 21 Jul 2021 14:12:30 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/5] migration: Shutdown src in
 await_return_path_close_on_source()
Message-ID: <YPhjjoAi4qm4U+MY@t490s>
References: <20210721012134.792845-1-peterx@redhat.com>
 <20210721012134.792845-3-peterx@redhat.com>
 <YPfu9N98PyTp7AKX@work-vm> <YPg//E0nJwCykzaw@t490s>
 <YPhguFWw32UPwSeq@work-vm>
MIME-Version: 1.0
In-Reply-To: <YPhguFWw32UPwSeq@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 07:00:24PM +0100, Dr. David Alan Gilbert wrote:
> Yes, I think that's best; but try to do as little as possible with the
> lock held.

Yep; non-blocking for the OOB thread.  Will do.

-- 
Peter Xu


