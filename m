Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF241D9A5F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 16:51:01 +0200 (CEST)
Received: from localhost ([::1]:57934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb3a8-0002Xd-7A
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 10:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>) id 1jb3ZA-0001T0-Vr
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:50:01 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:44770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>) id 1jb3Z9-00026b-Du
 for qemu-devel@nongnu.org; Tue, 19 May 2020 10:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=He5dhDsG6/vbxeYNWPSne8VNPbCmFgAty6aQKr3uwAk=; 
 b=EpYO/C74fr//2V0lAvdY/zaRFw7ETd5H8t2mcJskl6OvgKGuHKg9Cjz6zb4x9Z75/0dpDDg7cyMJ1LkhW+dWn6AWRsSWvKD1vcKN3JBoPN+qAsNlMdGgptd1P4Nvewy8R84uNSIMcJyjJaOZrIIQ3H+uhqLfYFRGSNTCZAlKzrFxPMT7jlFWwwHRLOK6VxAIk6fGzPlDWv5+/7t+N3rCwB9Kae7Enauuvt/gJ2ZiexNq2cqaoFDAudgo128Kv9eLwAaHSIC+U/aWODBwiZMixuZUkoxHzoigscZNzolnIIi7pZNNcmnN6W8l3+IL0vX8nrrgH2r7UzujB5I6+Xn0Kg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jb3Yf-0007sm-6V; Tue, 19 May 2020 16:49:29 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jb3Ye-0006xy-SH; Tue, 19 May 2020 16:49:28 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>, Tao Xu <tao3.xu@intel.com>
Subject: Re: Migration with ``drive-mirror`` + NBD will let quorum qcow2 image
 become larger
In-Reply-To: <20200519091544.GD7652@linux.fritz.box>
References: <3b1bbe79-088c-2e65-178f-074ac0f72ec6@intel.com>
 <20200519091544.GD7652@linux.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 19 May 2020 16:49:28 +0200
Message-ID: <w51blmknfnr.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 10:49:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Zhang Chen <chen.zhang@intel.com>, John Snow <jsnow@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 19 May 2020 11:15:44 AM CEST, Kevin Wolf wrote:
> But maybe it could return a limited set of flags at least so that the
> mirror job can get the BDRV_BLOCK_ZERO information if the quorum
> children agree on it.

Yeah, maybe it is possible to implement a conservative version of that
function and fall back to BDRV_BLOCK_DATA | BDRV_BLOCK_ALLOCATED (or
something like that) in the cases where there's no clear alternative.

Berto

