Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5570E310C9C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:38:26 +0100 (CET)
Received: from localhost ([::1]:42466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82Fd-0005oz-DH
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l82Ds-0004cw-5P
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:36:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l82Dq-0007U4-3y
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:36:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612535793;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/vizd6mekfrRgm5TBdMWUobQtTY5rEIc5CyHj+U1/xQ=;
 b=HjNvuBpcHdPQTBIhdoq+VEHmF8HsQdC5/BI8EMe2Gvi5CzZRf55Khj3CELzy9Nr1E6MBDc
 Dt9RWGqqK2xQ6IbRkTIq+3nEPsfmEEqqLLwDmDSx+oTCwJPKOmTv9dBN1JKzeTwCtyXadt
 QkGGuJFpewA7Xj9ho1rpxldTNWF16fc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-RWEtTU4gMs6UhGkdFSHvVQ-1; Fri, 05 Feb 2021 09:36:27 -0500
X-MC-Unique: RWEtTU4gMs6UhGkdFSHvVQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71822100CCC0;
 Fri,  5 Feb 2021 14:36:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4227360937;
 Fri,  5 Feb 2021 14:36:23 +0000 (UTC)
Date: Fri, 5 Feb 2021 14:36:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/3] utils: Improve qemu_strtosz() to have 64 bits of
 precision
Message-ID: <20210205143620.GQ908621@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-2-eblake@redhat.com>
 <20210205110206.GD908621@redhat.com>
 <1e2a3fbf-b501-403e-d472-3b114c6b18ea@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1e2a3fbf-b501-403e-d472-3b114c6b18ea@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, rjones@redhat.com, tao3.xu@intel.com, armbru@redhat.com,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 08:27:14AM -0600, Eric Blake wrote:
> On 2/5/21 5:02 AM, Daniel P. Berrangé wrote:
> 
> >>  /*
> >> - * Convert string to bytes, allowing either B/b for bytes, K/k for KB,
> >> - * M/m for MB, G/g for GB or T/t for TB. End pointer will be returned
> >> - * in *end, if not NULL. Return -ERANGE on overflow, and -EINVAL on
> >> - * other error.
> >> + * Convert size string to bytes.
> >> + *
> >> + * Allow either B/b for bytes, K/k for KB, M/m for MB, G/g for GB or
> >> + * T/t for TB, with scaling based on @unit, and with @default_suffix
> >> + * implied if no explicit suffix was given.
> >> + *
> >> + * The end pointer will be returned in *end, if not NULL.  If there is
> >> + * no fraction, the input can be decimal or hexadecimal; if there is a
> >> + * fraction, then the input must be decimal and there must be a suffix
> >> + * (possibly by @default_suffix) larger than Byte, and the fractional
> >> + * portion may suffer from precision loss or rounding.  The input must
> >> + * be positive.
> > 
> > Even though the test suite gives some illustrations, I think we should
> > document here the patterns we're intending to support. IIUC, we aim for
> > 
> > [quote]
> > The size parsing supports the following syntaxes
> > 
> >  - 12345   - decimal, bytes
> >  - 12345{bBkKmMgGtT} - decimal, scaled bytes
> 
> Yes.  Actually 12345{bBkKmMgGtTpPeE}, as long as it doesn't overflow 16E.
> 
> >  - 12345.678 - fractional decimal, bytes
> 
> No - this was already rejected prior to my patch, and my patch keeps it
> as rejected (that's the whole mul_required bool, which checks whether
> mul > 1).

Oh yes, of course.

> >  - 12345.678{bBkKmMgGtT} - fractional decimal, scaled bytes
> 
> Close; we reject bB in this situation for the same reason that we reject
> fractional decimal without suffix.  Also, patch 3/3 was questioning
> whether the fractional portion must be exact or is permitted to round

Yep, rejecting bB makes sense.

> 
> >  - 0x7FEE  - hex, bytes
> 
> Yes, and with the additional note that 'E' and 'B' are treated as hex
> digits, not scale suffixes, in this form.
> 
> > 
> > The following are intentionally not supported
> > 
> >  - octal
> 
> Never has worked.
> 
> >  - fractional hex
> 
> worked by accident, dropping it in this patch is not deemed worth a
> deprecation period.
> 
> >  - floating point exponents
> 
> worked by accident, dropping it in this patch is not deemed worth a
> deprecation period.
> 
> > [/quote]
> 
> and with one more form:
> 
> patch 2/3
>  - 0x123abc{kKmMgGtTpP} - hex, scaled bytes, with limited set of working
> suffixes, and slated for future removal (this one is barely plausible
> enough that we need the deprecation period to see who uses it)

Ok


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


