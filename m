Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AB633EEA7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 11:47:54 +0100 (CET)
Received: from localhost ([::1]:59264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMTiT-0001SC-JI
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 06:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lMTeF-0006hL-M1
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:43:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lMTe8-00031J-Mq
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 06:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615977803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BientLrGpJ0X1m2uLplDPGH7esJbB2sdY0X3iQDhwF4=;
 b=b8BKwK5zvIDD808CB0Y4fVhcycZ+fxxbCJRKsV/wJxybC7kOX1FcBEbvxQ77zcsUiHLj2Y
 hQ8pnPaN3Gm3ggvvZ8cw06rTWO658DyQMfiUBB9NW9DZamGVicX4+oMC3zo93GvqvYEXK9
 ogaO7AR59nNlsKwlGS2EQbNwViF9seU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-moz9ANh4MaiQ_3sZMJ9fRg-1; Wed, 17 Mar 2021 06:43:21 -0400
X-MC-Unique: moz9ANh4MaiQ_3sZMJ9fRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D86B107ACCA;
 Wed, 17 Mar 2021 10:43:20 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43A5719D61;
 Wed, 17 Mar 2021 10:43:15 +0000 (UTC)
Date: Wed, 17 Mar 2021 11:43:12 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v3] qga: return a more explicit error on why a command is
 disabled
Message-ID: <YFHdQC5kn0peuGXz@angien.pipo.sk>
References: <20210219082814.2661979-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210219082814.2661979-1-marcandre.lureau@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: michael.roth@amd.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 19, 2021 at 12:28:14 +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> qmp_disable_command() now takes an optional error string to return a
> more explicit error message.
> 
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=1928806
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> v3:
>  - back to passing an error string, but appended to the error message.

Reviewed-by: Peter Krempa <pkrempa@redhat.com>


