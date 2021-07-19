Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8DB3CEB68
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 21:44:55 +0200 (CEST)
Received: from localhost ([::1]:41624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ZC9-0003Gf-QL
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 15:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5ZBP-0002b3-GC
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m5ZBM-0002YW-Q9
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 15:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626723842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gkgzAdedUhQN9WzE8qHnlpIvKqswbMXzc5zEfe6Na+Y=;
 b=YHU1lgvz8LgjcbN4hvsADxzbE+q/aNqkkrvRrIhNjr4S4b3WCqHzxC3fTqF+ZDSQsrVg9U
 PTqZ1I58mimtnh1JjvDFkGGAbmGa5vuttHPQF0sfynZTIOYInfcXNp9Wi9ZUk/azyNCfOr
 g0ljzkWvQfKHbV0YHH4+hicU1WIlXx0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-YKvY0FTeMS2IkgqctXkn9w-1; Mon, 19 Jul 2021 15:44:01 -0400
X-MC-Unique: YKvY0FTeMS2IkgqctXkn9w-1
Received: by mail-qt1-f200.google.com with SMTP id
 b6-20020a05622a0206b029025eb726dd9bso7829720qtx.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 12:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gkgzAdedUhQN9WzE8qHnlpIvKqswbMXzc5zEfe6Na+Y=;
 b=a7KCvZRx6ApJNQ7X+sb7BdlysiT4+0p0gtHXEUYgCsvWBFt8VrgVAhxA7Wz9fx8Neu
 XOJuzt4odbXXoxnDGMA7tuzoj7s0x9TbdwfXGN15u3hA/ny1oUwmE9Q1z/sD+wKUpOSc
 gSgFpXAYCDP4GHyU+NNU+lfiYH/gEQylBVoOR116+x44MG+8V5K5bb7gZespknHj8DYd
 TXK1QS1Pg90kFt3Ig0PhdjyH7jZOPoLjgW3HrFrylj6sA7PZ0zb9wW5aeIuJLSaAkz12
 uknXbDORfDx9HLJIWj6Ord+DbTTgsoE7YrJwyZnPNYMzYr1cdSTMRf/O9XlyrCiW5Kl0
 EEuA==
X-Gm-Message-State: AOAM530wMXBLR+qlvBKZ4kSM5iiYp15gln1DSR6hdXrghMg4xKMri7aO
 NJkb8LwtWl1mqkIQ8g5wZsFpWhciJpGb0J+b6S6e71LY9M4dAPSepKG7NkqigdE7q6YuiZ0LPY1
 ExnB0xDsQH9/bzIY=
X-Received: by 2002:ad4:4a31:: with SMTP id n17mr26564943qvz.2.1626723841445; 
 Mon, 19 Jul 2021 12:44:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxglHpDGfQxxa4OacC+YOCoJLXKbIoQxdx1x9r60HQyAAuz6pTpvLo07WJp3mAz53qpzAz3ug==
X-Received: by 2002:ad4:4a31:: with SMTP id n17mr26564925qvz.2.1626723841217; 
 Mon, 19 Jul 2021 12:44:01 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id d25sm6849842qtq.55.2021.07.19.12.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 12:44:00 -0700 (PDT)
Date: Mon, 19 Jul 2021 15:43:59 -0400
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH] tests/qtest/migration-test.c: use 127.0.0.1 instead of 0
Message-ID: <YPXV/1H8L4RSQ6y7@t490s>
References: <20210719185217.122105-1-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210719185217.122105-1-dgilbert@redhat.com>
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: thuth@redhat.com, berrange@redhat.com, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 07:52:17PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> OpenBSD doesn't like :0 as an address, switch to using 127.0.0.1
> in baddest; it's really testing the :0 port number that isn't allowed
> on anything.
> 
> (The test doesn't currently run anyway because of the userfault
> problem that Peter noticed, but this gets us closer to being able to
> reenable it)
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


