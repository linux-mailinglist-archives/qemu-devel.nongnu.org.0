Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97D62F6F71
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 01:27:48 +0100 (CET)
Received: from localhost ([::1]:60158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Cxv-0004dp-R8
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 19:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1l0Cvs-0003RJ-UP
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 19:25:40 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:35030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1l0Cvm-0005N8-9m
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 19:25:40 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10F0Gvi5106595;
 Fri, 15 Jan 2021 00:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2020-01-29;
 bh=iPmUUjfbdn1pIUeXFYb6jYk+JL2X5AvUUmJxtpziUcc=;
 b=B536Yta1YV9eX2dqBv9Yl8ZnEFQLPHnGwtJm6OuIvpFOAcleIoWNpFLirmfVgdvNXN6I
 x6eyxH7qOCCA/faieyKpaDIJRZzJaX/oUE7j4cIHCMXA4GqjKnLJLs0z8K+lYD51viyD
 YBK5jbwm6TymP7B9z0GyfO9bKxWtnZBH9m3dhSSiEwZazJcDh5r+GLzTO8yN0I9IxV9c
 Wvtmz5KpDn6QLXM488oL8ZDcpxD+B8Iu1KmNLUyOlXxxmVbvBwRQcMIbUaTZ85K7T9t1
 RZCthyxmrwTb7XC8KJeAgS3PzIivv0w7peSzAn/Jh9PxPwOC2Uqzz7dP1OJlA++mKSLG 0A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 360kvkasaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 00:25:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10F0EefH083318;
 Fri, 15 Jan 2021 00:25:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 360kfa9ddk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 00:25:29 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10F0PRRQ002311;
 Fri, 15 Jan 2021 00:25:28 GMT
Received: from localhost.localdomain (/10.211.9.80)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 16:25:27 -0800
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/2] Add debug interface to kick/call on purpose
Date: Thu, 14 Jan 2021 16:27:28 -0800
Message-Id: <20210115002730.1279-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150000
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9864
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1011 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150000
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=dongli.zhang@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 joe.jin@oracle.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, joao.m.martins@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtio device/driver (e.g., vhost-scsi and indeed any device including
e1000e) may hang due to the lost of IRQ or the lost of doorbell register
kick, e.g.,

https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg01711.html

The virtio-net was in trouble in above link because the 'kick' was not
taking effect (missed).

This RFC adds a new debug interface 'DeviceEvent' to DeviceClass to help
narrow down if the issue is due to lost of irq/kick. So far the new
interface handles only two events: 'call' and 'kick'. Any device (e.g.,
e1000e or vhost-scsi) may implement (e.g., via eventfd, MSI-X or legacy
IRQ).

The 'call' is to inject irq on purpose by admin for a specific device (e.g.,
vhost-scsi) from QEMU/host to VM, while the 'kick' is to kick the doorbell
on purpose by admin at QEMU/host side for a specific device.

This device can also be used as a workaround if call/kick is lost due to
virtualization software (e.g., kernel or QEMU) issue.


Below is from live crash analysis. Initially, the queue=3 has count=30 for
'kick' eventfd_ctx. Suppose there is data in vring avail while there is no
used available. We suspect this is because vhost-scsi was not notified by
VM. In order to narrow down and analyze the issue, we use live crash to
dump the current counter of eventfd for queue=3.

crash> eventfd_ctx ffffa10392537ac0
struct eventfd_ctx {
  kref = {
    refcount = {
      refs = {
        counter = 4
      }
    }
  }, 
  wqh = {
    lock = {
      {
        rlock = {
          raw_lock = {
            {
              val = {
                counter = 0
              }, 
              {
                locked = 0 '\000', 
                pending = 0 '\000'
              }, 
              {
                locked_pending = 0, 
                tail = 0
              }
            }
          }
        }
      }
    }, 
    head = {
      next = 0xffffa104ae40d360, 
      prev = 0xffffa104ae40d360
    }
  }, 
  count = 30,  -----> eventfd is 30 !!! 
  flags = 526336, 
  id = 26
}

Now we kick the doorbell for vhost-scsi queue=3 on purpose for diagnostic
with this interface.

{ "execute": "x-debug-device-event", "arguments": { "dev": "/machine/peripheral/vscsi0", "event": "kick", "queue": 3 } }


The counter increased to 31. Suppose the hang issue is addressed, it
indicates something bad is in software that the 'kick' is lost.

crash> eventfd_ctx ffffa10392537ac0
struct eventfd_ctx {
  kref = {
    refcount = {
      refs = {
        counter = 4
      }
    }
  },
  wqh = {
    lock = {
      {
        rlock = {
          raw_lock = {
            {
              val = {
                counter = 0
              },
              {
                locked = 0 '\000',
                pending = 0 '\000'
              },
              {
                locked_pending = 0,
                tail = 0
              }
            }
          }
        }
      }
    },
    head = {
      next = 0xffffa104ae40d360,
      prev = 0xffffa104ae40d360
    }
  },
  count = 31,  -----> eventfd incremented to 31 !!!
  flags = 526336,
  id = 26
}


Only the interface for vhost-scsi is implemented since this is RFC. I will
implement for other types (e.g., eventfd or MSI-X) if the RFC is reasonable.

Thank you very much!

Dongli Zhang



