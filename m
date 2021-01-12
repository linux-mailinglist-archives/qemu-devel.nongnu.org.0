Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26EB2F32AB
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:10:55 +0100 (CET)
Received: from localhost ([::1]:38626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKNr-00081W-06
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@0bits.com>) id 1kzKJH-0005Rk-Qb
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:06:11 -0500
Received: from uk.hasbox.com ([2a01:7e00::f03c:91ff:fe91:5fdc]:37445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dave@0bits.com>) id 1kzKJE-0004Nf-RW
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:06:11 -0500
Received: from [10.0.0.170] ([5.30.22.212]) (authenticated bits=0)
 by uk.hasbox.com (8.15.2/8.15.2) with ESMTPSA id 10CE5tMH025151
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 14:05:56 GMT
To: qemu-devel@nongnu.org
From: Dave <dave@0bits.com>
Subject: absolute firmware path made relocatable in qemu 5.2.0
Message-ID: <abd662c1-9a4a-9c77-6533-875ab1924695@0bits.com>
Date: Tue, 12 Jan 2021 18:05:49 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------35AF608D4E42FFE6DB4925D3"
Content-Language: en-US
Received-SPF: none client-ip=2a01:7e00::f03c:91ff:fe91:5fdc;
 envelope-from=dave@0bits.com; helo=uk.hasbox.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------35AF608D4E42FFE6DB4925D3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Is seem that absolute firmwarepath compilation option is converted  to 
relocatable in 5.2.0 qemu.

# QEMU configure log Tue 12 Jan 14:46:41 GST 2021
# Configured with: '../configure' '--prefix=/usr' 
'--sysconfdir=/etc/qemu' '--disable-bochs'  
'*--firmwarepath=/usr/share/qemu:/usr/share/qemu-firmware*'
#

And trying to run the executable

    bash-5.1# ./qemu-system-x86_64
    qemu: could not load PC BIOS 'bios-256k.bin'

If i print out the resultant binary paths

    bash-5.1# ./qemu-system-x86_64 -L help
    /root/qemu/../share/qemu
    /root/qemu/../share/qemu-firmware

So there is no way to have a absolute path for firmware /bios and all 
qemu's that we test need to be at the right directory nesting to find 
firmware, bios etc or else they all need their own duplicate firmware 
files. Firmware path needs to honor the absolute paths i believe.

Comments ?

Dave


--------------35AF608D4E42FFE6DB4925D3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>Is seem that absolute firmwarepath compilation option is
      converted  to relocatable in 5.2.0 qemu.</p>
    <p># QEMU configure log Tue 12 Jan 14:46:41 GST 2021<br>
      # Configured with: '../configure' '--prefix=/usr'
      '--sysconfdir=/etc/qemu' '--disable-bochs'  '<b>--firmwarepath=/usr/share/qemu:/usr/share/qemu-firmware</b>'<br>
      #<br>
      <br>
    </p>
    <p>And trying to run the executable</p>
    <blockquote>bash-5.1# ./qemu-system-x86_64  <br>
      qemu: could not load PC BIOS 'bios-256k.bin'</blockquote>
    <p>If i print out the resultant binary paths</p>
    <blockquote>bash-5.1# ./qemu-system-x86_64 -L help<br>
      /root/qemu/../share/qemu<br>
      /root/qemu/../share/qemu-firmware</blockquote>
    <p>So there is no way to have a absolute path for firmware /bios and
      all qemu's that we test need to be at the right directory nesting
      to find firmware, bios etc or else they all need their own
      duplicate firmware files. Firmware path needs to honor the
      absolute paths i believe.</p>
    <p>Comments ? <br>
    </p>
    <p>Dave<br>
    </p>
  </body>
</html>

--------------35AF608D4E42FFE6DB4925D3--

