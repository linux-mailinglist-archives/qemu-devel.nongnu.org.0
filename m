Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCDD17406F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 20:44:42 +0100 (CET)
Received: from localhost ([::1]:53148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7lYv-0004JS-De
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 14:44:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43856)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j7lXk-0002yz-I2
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 14:43:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j7lXj-00044D-Mx
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 14:43:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:25986
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j7lXj-00043w-JS
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 14:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582919007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lLaGg1jlLk2dkkntFGZYa7vbMvjdq2uaGiZwf823CKI=;
 b=Do+C9BfckafN7V4VSFxAMO+3IhNdOLdwr6AXQ3Ju88G1c8lL4GOwvUkJGmNOZdByMJLqcp
 LDMG+qxYhPrYyEZaW46QiTtWKZ1xwb3PL1Qo0tnpITBPbC7xpi4aetbz48FS575o8Ay7bN
 dS6uOV3LGvx1Nbk6ixDyi1cNWc7u6FA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-GH-D099lOdCrVfwH3q3PLg-1; Fri, 28 Feb 2020 14:43:25 -0500
X-MC-Unique: GH-D099lOdCrVfwH3q3PLg-1
Received: by mail-qk1-f199.google.com with SMTP id v189so3765655qkb.16
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 11:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=24TpIwU/GC4lztKWdFu+BaL4hQ9MBDTFPMTNZSD7WbY=;
 b=sz1mQSiZM5PagxgFQkUbN5kkQgXuu9Cxn9SSl5MBv5Xa1/SAsZa108deqJOAfTfbKK
 fz7VAFHRsvkIeE9yvBGFn2J+hfEhfbtOzEZKEveBdHwu8pwnpDM0WQ0nqGq2KefJFrCw
 ubDiU9WQLJdm7/7oWpk7KoHjg4+qald9V445VHS2x2Vdsj7YR80Rinbma00DRCVA7h6o
 mmT/M7y+kYCQMvdl+MS//SoxLKIuIvQu14RMulnnPnQVVFwRAGOE2M0qrmYisTm1bmvi
 GvmfOvByGLN04CBst1E7DiDYdpgBFYB8BqajmuNZmwLaFwurukBuzzUMvwR4AA8BxS+6
 /2kw==
X-Gm-Message-State: APjAAAUCjl9JGuPm3I8txL6Kvu5rXUUZFfCriTiofmQrc3L8ywoTmLF+
 4A1YbdgBE4NGtrMwz3nANX5cTUFDIr6Lc/e2Zn4uUSeqXOgheuoFKNeYxZfpzfKucU2xMT2sQ+S
 OHQSmz2OsTqMC/Cc=
X-Received: by 2002:ac8:1206:: with SMTP id x6mr5858442qti.55.1582919005134;
 Fri, 28 Feb 2020 11:43:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJ4ItwV9K3jgsN1oimZ0k+XcCpYIlDstknXdOGt5ryGGOmWIB+oVa+lvzdqOJfSr/0mkCsog==
X-Received: by 2002:ac8:1206:: with SMTP id x6mr5858426qti.55.1582919004941;
 Fri, 28 Feb 2020 11:43:24 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id x3sm5710532qts.35.2020.02.28.11.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 11:43:24 -0800 (PST)
Date: Fri, 28 Feb 2020 14:43:22 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 07/15] util/mmap-alloc: Factor out calculation of the
 pagesize for the guard page
Message-ID: <20200228194322.GW180973@xz-x1>
References: <20200227101205.5616-1-david@redhat.com>
 <20200227101205.5616-8-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200227101205.5616-8-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 27, 2020 at 11:11:57AM +0100, David Hildenbrand wrote:
> Let's factor out calculating the size of the guard page and rename the
> variable to make it clearer that this pagesize only applies to the
> guard page.
>=20
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu


