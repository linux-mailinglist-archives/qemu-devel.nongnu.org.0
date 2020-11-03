Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54CC2A4BDC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Nov 2020 17:47:50 +0100 (CET)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZzTJ-0002zj-Tv
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 11:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZzRp-0001Oe-8b
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 11:46:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZzRm-0002fl-10
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 11:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604421973;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IIC25ruwFCkRXYWJEdIxg0j5nI8lFfcbShkIlrrYPKs=;
 b=O6hPvT7AkvhIP6sTmEY+KeLbMW+SeeuvMX4yY1qlwJFclZCgmsn+yuQ4uiYqL9NK5891qR
 ZrVQyuQy+cOcZgotyxpsLaOdnjEhJnzZAnlj8fHhbDon69FRj4DWYixOLUTzV6V9tgybby
 03XDVLChekqKUlF4cIl4hFrnR9OirtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-zcywQCegO6W0b2g1OUOUxA-1; Tue, 03 Nov 2020 11:46:07 -0500
X-MC-Unique: zcywQCegO6W0b2g1OUOUxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4628B6D584
 for <qemu-devel@nongnu.org>; Tue,  3 Nov 2020 16:46:06 +0000 (UTC)
Received: from redhat.com (ovpn-115-87.ams2.redhat.com [10.36.115.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBBF57366D;
 Tue,  3 Nov 2020 16:46:04 +0000 (UTC)
Date: Tue, 3 Nov 2020 16:46:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2] qapi, qemu-options: make all parsing visitors parse
 boolean options the same
Message-ID: <20201103164601.GS205187@redhat.com>
References: <20201103161339.447118-1-pbonzini@redhat.com>
 <20201103162551.GQ205187@redhat.com>
 <e950af86-c45d-4165-a9f2-85ee6e845b01@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e950af86-c45d-4165-a9f2-85ee6e845b01@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 01:02:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 03, 2020 at 05:33:47PM +0100, Paolo Bonzini wrote:
> On 03/11/20 17:25, Daniel P. Berrangé wrote:
> >> OptsVisitor, StringInputVisitor and the keyval visitor have
> >> three different ideas of how a human could write the value of
> >> a boolean option.  Pay homage to the backwards-compatibility
> >> gods and make the new common helper accept all four sets (on/off,
> >> true/false, y/n and yes/no), and case-insensitive at that.
> >>
> >> Since OptsVisitor is supposed to match qemu-options, adjust
> >> it as well.
> > FWIW, libvirt does not appear to use true/false or y/n, nor
> > ever use uppercase / mixed case.
> > 
> > IOW this level of back compat may well be overkill.
> > 
> > I'd particular suggest deprecating case-insensitivity, as
> > Yes, YES, yEs feel unlikely to be important or widely used.
> 
> True; at least it's type-safe code unlike the short-form boolean option.
>  It only hurts in the odd case of a boolean option becoming on/off/auto
> or on/off/split.
> 
> I didn't want to introduce deprecation at this point, because
> consistency is better anyway even if we plan to later deprecate
> something.  For example, since there is a common parser now, introducing
> deprecation would be much easier.  It also lets us switch parsers even
> during the deprecation period (which is how I got into this mess).

Ok,

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


