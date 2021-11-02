Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409A9442911
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:05:04 +0100 (CET)
Received: from localhost ([::1]:33114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhon1-0007U7-DK
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1mholJ-0006MQ-7b
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:03:17 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:58144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lma@suse.de>) id 1mholG-0005xh-P7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:03:16 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F066C2195B;
 Tue,  2 Nov 2021 08:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635840191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7WnDxsGcFWVCnV6djViJeDwVoAP9O7qGTMr8kLfkVYo=;
 b=Bm3VTSNO+gscsmlQxX/y0SwqdfSthDTsvKhPKh8Sm9uXC7ByCc51Q7qc5h35w0lmMPH+HM
 wNXsekgCrVaFypox/PmKwJdwAsHuekHZ/bqj8VivxcC+z9zieLzCzClahBgznmP6J3ujk/
 iBA9eo1O8jI9P0YHN1LGShguzKQVG+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635840191;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7WnDxsGcFWVCnV6djViJeDwVoAP9O7qGTMr8kLfkVYo=;
 b=ZP1W0z1QE4fz+lSSjBf68oryfYKscLxxNBt2CPy4rfwB1y2KAyBKSWGYjPOXZx+fZJRZ/h
 saqhPT4B9jt9rGDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E967E13B71;
 Tue,  2 Nov 2021 08:03:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iX+tOL/wgGHOWgAAMHmgww
 (envelope-from <lma@suse.de>); Tue, 02 Nov 2021 08:03:11 +0000
MIME-Version: 1.0
Date: Tue, 02 Nov 2021 16:03:11 +0800
From: lma <lma@suse.de>
To: qemu-devel@nongnu.org
Subject: Issue with acpi hotplug on pcie root ports in case of q35 + ovmf +
 machine type 6.1
User-Agent: Roundcube Webmail
Message-ID: <e7f2739ce7bb393aa8f5c550b0c5f418@suse.de>
X-Sender: lma@suse.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lma@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi list,

Have you experienced any acpi hotplugging issue while using q35 + ovmf + 
machine type 6.1?
According to the error message in guest kernel,  It seems qemu with ovmf 
doesn't prepare
enough resource in PCI space for acpi hotplugging on multifunction 
bridges.

Please refer to issue#705 for details:
https://gitlab.com/qemu-project/qemu/-/issues/705

Thanks,
Lin

