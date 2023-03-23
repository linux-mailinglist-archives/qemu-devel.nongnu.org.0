Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CCF6C648F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 11:15:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfHxa-00012k-7y; Thu, 23 Mar 2023 06:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <knw@spyro-soft.com>)
 id 1pfHxW-00012H-1S
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:14:14 -0400
Received: from mail-db5eur02on2041.outbound.protection.outlook.com
 ([40.107.249.41] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <knw@spyro-soft.com>)
 id 1pfHxS-0002O0-E0
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:14:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXlHNlBLpaPesYq9lkROfj8xo5aocsrs8z3Kc+fWIUcqGFIVZVkRQdfyuKEEml2mYNoXpJabP6RxWGiX1F3wBOVP7ctK1Um1KM7Bj6eDP6pqHiko4JqKU1cfvNfwTkpwbgvLv7dCsEbJ15nOMpRlhzQE56ggQHTeyA7tOwGtgKkkSRIoS8mNH5XBkA6gp9dItkPg12G76g1A8wPPztMFonxRwozLgxXP8fyqwyPKMDYyWJlaD1UdaAvpnhvUkijxyvvK3LGe8ld/3/DC8dRwxEpOzkbhXL3dP7/Zv+nJj/ZQgTID+QoPJxLkRgK5SxQJVdl7pfPaaI5h/7NwuGiuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBAIfraWILHKxvY4LIqo/8S//xK0NHBtLtBjHY7vXT8=;
 b=YMs5E4WudLs57zgmt7rLa1P58LqWsRbvGsJC4KNuWhcN1U3yb9uR09DvNAZTC/wVlJDkcae2hSPSwX/Dl5lkQ+gjGGTl5ZopN2sb+E3GAi4TTJTUVnJcUiqtS/cY3byk98DgzB//RZgmJcMu5ebF58Z8bklVmGt9KtxUNKWYrJQFL5xFsUY/us9Z6pnPAu/g4N5nZogxzDDsTq9fnYfYTL9A9WkLD06sFRgAKbk58UhjJ8E+QxvRtblmwU0WTh027GOUHTJqDfYPbR1bVx7+/JTeUO+i4jSbCqxYQPCRMnK3xCrV5mZqMKrr3KiEvpjlMcqVI3nTmZqsOzemh4Hm/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spyro-soft.com; dmarc=pass action=none
 header.from=spyro-soft.com; dkim=pass header.d=spyro-soft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spyro-soft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBAIfraWILHKxvY4LIqo/8S//xK0NHBtLtBjHY7vXT8=;
 b=mVs9PhVebXcBErQkXifKS6GvhEujsE5vjWcBv0oF3fC03+qh6+3SsGWJQsdAsCh5fd0s+lVLqRnRfL6uuHBARUr0IJavQpm6yTjoZvEJgAjRNBIXfQpqgPp29XQK/OE2FMHGCf2sYHUdRqyTq4ohbydFcQlKQ6N1tRSM8ho5imUo865V93FGUM2kWQwB+n3TfyDxxNQyTCYwAn7qorvGGEpvrFKldQhQdQM/2Z3SYcOAgGKFMF5KRHQtsi6Ty5Sur5aFurP+/yG2AYooptp/3T4SmMxZZZ+MzS6V5K6SGh3a1d1/v8YEjrzgT2FsS0V0tZm0+W9FkTKak2AsQami0A==
Received: from PAXP193MB1679.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:1cd::15)
 by PR3P193MB0571.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:24::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 10:09:02 +0000
Received: from PAXP193MB1679.EURP193.PROD.OUTLOOK.COM
 ([fe80::e1fe:74c1:9a18:2200]) by PAXP193MB1679.EURP193.PROD.OUTLOOK.COM
 ([fe80::e1fe:74c1:9a18:2200%9]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 10:09:02 +0000
From: Karol Nowak <knw@spyro-soft.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "philmd@linaro.org" <philmd@linaro.org>, "clg@kaod.org" <clg@kaod.org>
Subject: [RFC PATCH v1] hw/misc: add i2c slave device that passes i2c ops
 outside
Thread-Topic: [RFC PATCH v1] hw/misc: add i2c slave device that passes i2c ops
 outside
Thread-Index: AQHZXV7TZA/TT0nkrkqwOlsWBtSUpA==
Date: Thu, 23 Mar 2023 10:09:02 +0000
Message-ID: <PAXP193MB16793F753AA32E8FAA831D7B83879@PAXP193MB1679.EURP193.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=spyro-soft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXP193MB1679:EE_|PR3P193MB0571:EE_
x-ms-office365-filtering-correlation-id: 7dc801cf-2024-46ad-0f9e-08db2b86a0cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yPIMf3/1wqKMs1XBqXL3BA7fScS+XiH3y6GdhaVJgRs5CA0sKoMY0lo7JpSSim5MM9L0eGGYezCTqeuSdAGMH7RtahWajO5hNbwM0hK/C32sJW0Q5iwinDoqKSpkXHNpVBXeBRTW4FHafo5wZqFA2hkUMiByWfop4sySBCgiHuM758oJn/5msQtTuVmCE0A5Vr/1hi16DZMg7SnNIIgw6pocBtfCes3K2kYMUOQ2Rog9OACTaLxc4iZIVEDvrZnQxMUUm1rIcv637n4BgoyqdMQav0iCsjAmc1Y7FeWvO1O4iWWa+ZhECYLZ+cgjXAMuJw8AUqcmsNe+BHUYNJNvLyQGtM8nwc4K5bmr41atgiailzgEtx0od5Uk7Ae8VHf+9mDQSeWqDnKus83BjYLWLAbPAc6cygjn73ymP57y6KjytdXSZHDit+WQiYJC8gjhNGt8/BLdvIvTcKUI7uVr42NoEm8Tsb4NWSPZPV1ikVOPtjiHnE9rUbyz5mFeggZEansVw0qWQjJ63Hj7IXKNXdJWoWPE9EqTJLT4sdLM2gDnmuQyHI0cVXDJrcOv67SisXCrDFJxkPjw/i5kXZoykiRjJ8VQrvsOqoi2Zq2eCBS37g9xGHt1zY1K78hlSMgBBNKsW68LPJmjQwq8YbOteWqAJgsnE2KYqnpeMdxTkF4LbKeeDkk5YJK9pW1CLTomPmgVsFSgD8MmL+phvWbX3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXP193MB1679.EURP193.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39850400004)(366004)(346002)(376002)(396003)(136003)(451199018)(54906003)(19627405001)(41300700001)(86362001)(478600001)(8936002)(5660300002)(30864003)(33656002)(38070700005)(71200400001)(52536014)(66556008)(64756008)(66446008)(66476007)(7696005)(66946007)(6916009)(76116006)(91956017)(4326008)(8676002)(316002)(2906002)(122000001)(6506007)(38100700002)(26005)(9686003)(186003)(83380400001)(55016003)(66574015)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PR9+lf0sMnSbXrFu+//L6r7/A8Wnt1tdk4Y72V6XXNUd621nWTb6Cvqvkd?=
 =?iso-8859-1?Q?lKLZga2TuVE2R7x+6v5FS1hl9PhEgYdgk5onO7aQoBjJcL/CbN5gPMxnLx?=
 =?iso-8859-1?Q?Qae4sV/w1STrrWiTC3zusGnkIRjbW60r+x9CjfybcB793efAfAzi76AWAD?=
 =?iso-8859-1?Q?IhpY+oUXQV+NoysY9Rv1dswH6fRN5rInwjxlaWIq5tArkOouc/PJB+lPk+?=
 =?iso-8859-1?Q?bz4x4UbBzQ5HzlgqF66LlmqaMGoDIqQkWdnXZbajR+9x9Txm3bYHiZVchc?=
 =?iso-8859-1?Q?51fqb5ftEOXcqB4n1ahD2m/7l+tcXaIKCrd9oPhXVIraca/ksx2tMoqtnE?=
 =?iso-8859-1?Q?PhWG6Q+jQre52W+TmDkqawgttSlOHHK8e0bnQi6EGAmmlNqK8A/OrkqRxP?=
 =?iso-8859-1?Q?pW1KwPo/hJUWuI3QdgsnLRFqtQkBt+jbgEm+wz28sirz0061DPdAkvASz+?=
 =?iso-8859-1?Q?GwwmWnXGxRwCcaynv330d+vLZt4qFDeD7LAkPdyUIjAMik6W05Qx0il8Vf?=
 =?iso-8859-1?Q?z6qWZq/fnRsKUJ9ccNc4vkltYP96vBGvleVS1g75l2Dpl7WI5f9fTOe/TO?=
 =?iso-8859-1?Q?QvbZNrRY5OlHkqEKTy9jB4lS0hl5YkyfAr17KFsA0EixtgU2MF5/KfCp+v?=
 =?iso-8859-1?Q?TQdWMC/HmULclDn66e4dXANFrXuFRGDqqfRjdq58lD5BM92tOoMPffANoD?=
 =?iso-8859-1?Q?SIAA89NDes6RHtcygRx01VXDY+QyWi5j/pLoAEiCfWwDDPD48mlS1fqnwC?=
 =?iso-8859-1?Q?FPySsJSO/JLqhIVSzoRcXt17EjWMXCWgYgrvcza6F2K8QejuS7f6xNoUS6?=
 =?iso-8859-1?Q?OoWa7MnWlOKlu/CVMmFosV0kRvCdT3oe/Sprrm0vaw/SQoQ/7RWazaqsqd?=
 =?iso-8859-1?Q?sHc4KO8BSZ0bWSBa46CV72YCu82hi6aB0vi9z1KKDn4Wg47Ap2rgjygLc+?=
 =?iso-8859-1?Q?pCDL5E9WHD3BZRAoeG2SIV10LjgVwvgxA2cAa3pvTm1o6YzRPyWNNt6eWo?=
 =?iso-8859-1?Q?q/ZOFShzliIhAyKmu89h05Q26hQHtHbL8z2/zQUyNXCUnzTjYqjRdfyTZK?=
 =?iso-8859-1?Q?uKiwg0h29pSHNuBfNOzL8qJ45kzD0Oig+5WACZJe3jnNmjhF9ybWiphvaX?=
 =?iso-8859-1?Q?8vh3nD2xDbXtf8YXdJq8VEwXUa7G79etkvjwZWVzj9xdrStSWdnSwjIRwp?=
 =?iso-8859-1?Q?cknlixmVnWBmz+IddHrhVZg8ZzonZyzL31mmlFdLbCNG9JbCsN8vaSjjH5?=
 =?iso-8859-1?Q?Rb96LOOLw/JnfpyCUX373m4cRSJbq38Trpy7q6IyHQ2rNYI11jwVo04fp5?=
 =?iso-8859-1?Q?8SJE9sPrySAJJGOAjkPA8XO8KksXiNu2WElPFRZa5yiXcEb975jgfYXv+U?=
 =?iso-8859-1?Q?f8C9J6sShegWSDx+5LySWjcKa/hbfJhW+Drk77JsVS1RajXCxKvDWuOufk?=
 =?iso-8859-1?Q?n9LzbURA0tkPLSaLbx3R+r9Kdf+DnV7xSEAPhwmLJX7gSyJWcCAXazLDaM?=
 =?iso-8859-1?Q?CgQ4wC+gkL+Hdi1LRpuKG3dtWzOpoStDS715dD9cltE+alUjDYgylpHg7Z?=
 =?iso-8859-1?Q?FR9Mdyhg6dL2IMhTf6u9sv6jzl2lSm/lA7bRz2H9pfKSO0wazp6V//rPmL?=
 =?iso-8859-1?Q?3wvwXbjH+fjMA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PAXP193MB16793F753AA32E8FAA831D7B83879PAXP193MB1679EURP_"
MIME-Version: 1.0
X-OriginatorOrg: spyro-soft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXP193MB1679.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc801cf-2024-46ad-0f9e-08db2b86a0cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 10:09:02.6306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fbcab9a6-38ab-4bcd-ab3d-a468c8ee380c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xHQ0eAqXYjtIlvVU+W7whFGHaR8lEYVwY0lVKN0CFbvLoDkgwipgEXzuWOGuSLEN5KPkFRrEUrD6RKC3oT+wFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB0571
Received-SPF: pass client-ip=40.107.249.41; envelope-from=knw@spyro-soft.com;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--_000_PAXP193MB16793F753AA32E8FAA831D7B83879PAXP193MB1679EURP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

There is a feature I prepared which may be practical for some QEMU users.

The feature provides a new I2C slave device
that prepares a message depending what i2c-slave callback was called
and sends it outside of QEMU through the character device to a client
that receives that message, processes it and send back a response.
Thanks to that feature,
a user can emulate a logic of I2C device outside of QEMU.
The message contains 3 bytes ended with CRLF: BBB\r\l
Basically, the I2C slave does 4 steps in each i2c-slave callback:
* encode
* send
* receive
* decode

I put more details in esp32_i2c_tcp_slave.c
and also provided a demo client in python that uses TCP.

The feature still needs some improvements, but the question is:
* Do you find the feature useful?


NOTE:
The feature originally was prepared for espressif/qemu
that's why there are references to esp32


Signed-off-by: Karol Nowak <knw@spyro-soft.com>
---
 hw/misc/esp32_i2c_tcp_slave.c         | 288 ++++++++++++++++++++++++++
 include/hw/misc/esp32_i2c_tcp_slave.h |  19 ++
 tests/i2c-tcp-demo/i2c-tcp-demo.py    | 133 ++++++++++++
 3 files changed, 440 insertions(+)
 create mode 100644 hw/misc/esp32_i2c_tcp_slave.c
 create mode 100644 include/hw/misc/esp32_i2c_tcp_slave.h
 create mode 100644 tests/i2c-tcp-demo/i2c-tcp-demo.py

diff --git a/hw/misc/esp32_i2c_tcp_slave.c b/hw/misc/esp32_i2c_tcp_slave.c
new file mode 100644
index 0000000000..db3b6d366a
--- /dev/null
+++ b/hw/misc/esp32_i2c_tcp_slave.c
@@ -0,0 +1,288 @@
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/log.h"
+#include "hw/i2c/i2c.h"
+#include "hw/irq.h"
+#include "hw/misc/esp32_i2c_tcp_slave.h"
+#include "qemu/module.h"
+
+#include "qapi/qmp/json-writer.h"
+#include "chardev/char-fe.h"
+#include "io/channel-socket.h"
+#include "chardev/char-io.h"
+#include "chardev/char-socket.h"
+#include "qapi/error.h"
+
+/*
+ * Description:
+ * To allow to emulate a I2C slave device which is not supported by QEMU,
+ * a new I2C slave device was created that encapsulates I2C operations
+ * and passes them through a selected chardev to the host
+ * where a client resides that implements a logic of emulated device.
+ *
+ *
+ * Architecture:
+ *    ---------------------------
+ *    | QEMU                    |
+ *    |                         |         -----------------------
+ *    |  ESP32 Firmware writes  |         |                     |
+ *    |  to I2C Slave           |         | I2C Slave Emulation |
+ *    |                         |         |                     |
+ *    |  -----------------------&---------&----                 |
+ *    |  | I2C Slave at 0x7F    &   tcp   &     recv msg        |
+ *    |  -----------------------&---------&---- process msg     |
+ *    |                         |         |     send respone    |
+ *    |                         |         |                     |
+ *    |                         |         |                     |
+ *    ---------------------------         |----------------------
+ *
+ *
+ * Syntax & protocol:
+ *      QEMU I2C Slave sends a msg in following format: BBB\r\n
+ *      where each 'B' represents a single byte 0-255
+ *      QEMU I2C Slave expects a respone message in the same format as fas=
t as possible
+ *      Example:
+ *         req: 0x45 0x01 0x00 \r\n
+ *        resp: 0x45 0x01 0x00 \r\n
+ *
+ *      The format BBB\r\n
+ *        first 'B' is a message type
+ *        second 'B' is a data value
+ *        third 'B' is an error value (not used at the moment)
+ *
+ *      There are three types of message
+ *        'E' or 0x45 - Event:
+ *        'S' or 0x53 - Send: byte sent to emulated I2C Slave
+ *        'R' or 0x52 - Recv: byte to be received by I2C Master
+ *
+ *
+ *      'E' message
+ *        second byte is an event type:
+ *         0x0: I2C_START_RECV
+ *         0x1: I2C_START_SEND
+ *         0x2: I2C_START_SEND_ASYNC
+ *         0x3: I2C_FINISH
+ *         0x4: I2C_NACK
+ *
+ *        Example:
+ *            0x45 0x01 0x00  - start send
+ *            0x45 0x03 0x00  - finish
+ *
+ *        In case of 'E' message, a response is the same as a request mess=
age
+ *
+ *      'S' message
+ *        second byte is a byte transmitted from I2C Master to I2C slave d=
evice
+ *        the byte to by processed by I2C Slave Device
+ *
+ *        Example:
+ *            0x53 0x20 0x00
+ *
+ *        In case of 'S' message, a response is the same as a request mess=
age
+ *
+ *      'R' message
+ *        the I2C Master expect a byte from the emulated i2c slave device
+ *        A client has to modify the second byte of the request message
+ *         and send it back as a response.
+ *
+ *        Example:
+ *             req: 0x52 0x00 0x00
+ *            resp: 0x52 0x11 0x00
+ *
+ *
+ * Examples of Transmission:
+ *     1) i2cset -c 0x7F -r 0x20 0x11 0x22 0x33 0x44 0x55
+ *          req: 45 01 00
+ *         resp: 45 01 00
+ *
+ *          req: 53 20 00
+ *         resp: 53 20 00
+ *
+ *          req: 53 11 00
+ *         resp: 53 11 00
+ *
+ *          req: 53 22 00
+ *         resp: 53 22 00
+ *
+ *          req: 53 33 00
+ *         resp: 53 33 00
+ *
+ *          req: 53 44 00
+ *         resp: 53 44 00
+ *
+ *          req: 53 55 00
+ *         resp: 53 55 00
+ *
+ *          req: 45 03 00
+ *         resp: 45 03 00
+ *
+ *     2) i2cget -c 0x7F -r 0x20 -l 0x03
+ *          req: 45 01 00
+ *         resp: 45 01 00
+ *
+ *          req: 53 20 00
+ *         resp: 53 20 00
+ *
+ *          req: 45 03 00
+ *         resp: 45 03 00
+ *
+ *          req: 45 00 00
+ *         resp: 45 00 00
+ *
+ *          req: 52 00 00
+ *         resp: 52 11 00
+ *
+ *          req: 52 00 00
+ *         resp: 52 22 00
+ *
+ *          req: 52 00 00
+ *         resp: 52 33 00
+ *
+ *          req: 45 03 00
+ *         resp: 45 03 00
+ *
+ *
+ * To start i2c.socket server, set QEMU param:
+ *   -chardev socket,port=3D16001,wait=3Dno,host=3Dlocalhost,server=3Don,i=
pv4=3Don,id=3Di2c.socket
+ *
+ * Simple demo I2C Slave Emulation in Python:
+ *   tests/i2c-tcp-demo/i2c-tcp-demo.py
+ *
+ * Limitations:
+ *   - there is no recv timeout which may lead to qemu hang
+ *
+ */
+
+#define CHARDEV_NAME "i2c.socket"
+
+static Chardev *chardev;
+static CharBackend char_backend;
+static bool chardev_open;
+
+typedef struct {
+    uint8_t id;
+    uint8_t byte;
+    uint8_t err;
+} packet;
+
+static int chr_can_receive(void *opaque)
+{
+    return CHR_READ_BUF_LEN;
+}
+
+static void chr_event(void *opaque, QEMUChrEvent event)
+{
+    switch (event) {
+    case CHR_EVENT_OPENED:
+        qemu_log("connected\n");
+        chardev_open =3D true;
+        break;
+    case CHR_EVENT_CLOSED:
+        qemu_log("disconnected\n");
+        chardev_open =3D false;
+        break;
+    case CHR_EVENT_BREAK:
+    case CHR_EVENT_MUX_IN:
+    case CHR_EVENT_MUX_OUT:
+        /* Ignore */
+        break;
+    }
+}
+
+static void send_packet(packet *p)
+{
+    static const char *PACKET_FMT =3D "%c%c%c\r\n";
+    static char buff[32];
+
+    /* encode */
+    int len =3D snprintf(buff, sizeof(buff), PACKET_FMT, p->id, p->byte, p=
->err);
+
+    /* send */
+    qemu_chr_fe_write_all(&char_backend, (uint8_t *)buff, len);
+
+    /* receive */
+    qemu_chr_fe_read_all(&char_backend, (uint8_t *)buff, len);
+
+    /* decode */
+    sscanf(buff, PACKET_FMT, &p->id, &p->byte, &p->err);
+}
+
+static uint8_t slave_rx(I2CSlave *i2c)
+{
+    packet p =3D {.id =3D 'R',
+                .byte =3D 0,
+                .err =3D 0};
+
+    send_packet(&p);
+
+    return p.byte;
+}
+
+static int slave_tx(I2CSlave *i2c, uint8_t data)
+{
+    packet p =3D {.id =3D 'S',
+                .byte =3D data,
+                .err =3D 0};
+
+    send_packet(&p);
+
+    return 0;
+}
+
+static int slave_event(I2CSlave *i2c, enum i2c_event event)
+{
+    packet p =3D {.id =3D 'E',
+                .byte =3D event,
+                .err =3D 0};
+
+    send_packet(&p);
+
+    return 0;
+}
+
+static void slave_realize(DeviceState *dev, Error **errp)
+{
+}
+
+static void slave_init(Object *obj)
+{
+    Error *err =3D NULL;
+    chardev =3D qemu_chr_find(CHARDEV_NAME);
+    if (!chardev) {
+        error_report("chardev '%s' not found", CHARDEV_NAME);
+        return;
+    }
+
+    if (!qemu_chr_fe_init(&char_backend, chardev, &err)) {
+        error_report_err(err);
+        return;
+    }
+
+    qemu_chr_fe_set_handlers(&char_backend, chr_can_receive, NULL, chr_eve=
nt,
+                             NULL, NULL, NULL, true);
+}
+
+static void slave_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
+
+    dc->realize =3D slave_realize;
+    k->event =3D slave_event;
+    k->recv =3D slave_rx;
+    k->send =3D slave_tx;
+}
+
+static const TypeInfo esp32_i2c_tcp_info =3D {
+    .name =3D TYPE_ESP32_I2C_TCP,
+    .parent =3D TYPE_I2C_SLAVE,
+    .instance_size =3D sizeof(ESP32_I2C_TCP_State),
+    .instance_init =3D slave_init,
+    .class_init =3D slave_class_init,
+};
+
+static void esp32_i2c_tcp_type_init(void)
+{
+    type_register_static(&esp32_i2c_tcp_info);
+}
+
+type_init(esp32_i2c_tcp_type_init);
diff --git a/include/hw/misc/esp32_i2c_tcp_slave.h b/include/hw/misc/esp32_=
i2c_tcp_slave.h
new file mode 100644
index 0000000000..e36bac7ffe
--- /dev/null
+++ b/include/hw/misc/esp32_i2c_tcp_slave.h
@@ -0,0 +1,19 @@
+/*
+ */
+#ifndef QEMU_ESP32_I2C_TCP_SLAVE_H
+#define QEMU_ESP32_I2C_TCP_SLAVE_H
+
+#include "hw/i2c/i2c.h"
+#include "qom/object.h"
+
+#define TYPE_ESP32_I2C_TCP "esp32_i2c_tcp"
+OBJECT_DECLARE_SIMPLE_TYPE(ESP32_I2C_TCP_State, ESP32_I2C_TCP)
+
+/**
+ */
+struct ESP32_I2C_TCP_State {
+    /*< private >*/
+    I2CSlave i2c;
+};
+
+#endif
diff --git a/tests/i2c-tcp-demo/i2c-tcp-demo.py b/tests/i2c-tcp-demo/i2c-tc=
p-demo.py
new file mode 100644
index 0000000000..d4bec457f3
--- /dev/null
+++ b/tests/i2c-tcp-demo/i2c-tcp-demo.py
@@ -0,0 +1,133 @@
+import json
+from twisted.internet import task
+from twisted.internet.defer import Deferred
+from twisted.internet.protocol import ClientFactory
+from twisted.protocols.basic import LineReceiver
+from dataclasses import dataclass
+from enum import Enum
+
+# i2cset -c 0x7F -r 0x20 0x11 0x22 0x33 0x44 0x55
+# i2cget -c 0x7F -r 0x20 -l 0x0A
+
+HOST =3D "localhost"
+PORT =3D 16001
+
+
+class EVENT(Enum):
+    I2C_START_RECV =3D 0
+    I2C_START_SEND =3D 1
+    I2C_START_SEND_ASYNC =3D 2
+    I2C_FINISH =3D 3
+    I2C_NACK =3D 4
+
+
+@dataclass
+class I2CSlave:
+    mem: bytearray =3D bytearray(256)
+    mem_addr: int =3D 0
+    curr_addr: int =3D 0
+    first_send: bool =3D True
+    recv_conuter: int =3D 0
+
+
+i2cslave =3D I2CSlave()
+
+
+def dump_mem():
+    print("Mem:")
+    bytes_per_row =3D 32
+    rows =3D int(256 / bytes_per_row)
+    for i in range(0, rows):
+        begin =3D i*bytes_per_row
+        end =3D begin+bytes_per_row
+        prefix =3D hex(begin)
+        if i =3D=3D 0:
+            prefix =3D "0x00"
+        print(prefix + ": " + i2cslave.mem[begin:end].hex(" "))
+
+    print("\n")
+
+
+def event_handler(packet):
+    evt =3D EVENT(packet[1])
+    print("Event handler: " + evt.name)
+
+    if evt is EVENT.I2C_FINISH:
+        i2cslave.recv_conuter =3D 0
+        i2cslave.first_send =3D True
+        dump_mem()
+
+    return packet
+
+
+def recv_handler(packet):
+    print("Recv handler: byte number " + str(i2cslave.recv_conuter) +
+          " from addr=3D" + hex(i2cslave.mem_addr) +
+          ", val=3D" + hex(i2cslave.mem[i2cslave.mem_addr]))
+    i2cslave.recv_conuter +=3D 1
+    resp =3D bytearray(packet)
+    resp[1] =3D i2cslave.mem[i2cslave.mem_addr]
+    i2cslave.mem_addr +=3D 1
+    if i2cslave.mem_addr =3D=3D 256:
+        i2cslave.mem_addr =3D 0
+    return bytes(resp)
+
+
+def send_handler(packet):
+    print("Send handler: ", end=3D'')
+    if i2cslave.first_send =3D=3D True:
+        print("address byte: ", hex(packet[1]))
+        i2cslave.mem_addr =3D packet[1]
+        i2cslave.first_send =3D False
+    else:
+        print("data byte: ", hex(packet[1]))
+        i2cslave.mem[i2cslave.mem_addr] =3D packet[1]
+        i2cslave.mem_addr +=3D 1
+        if i2cslave.mem_addr =3D=3D 256:
+            i2cslave.mem_addr =3D 0
+    return packet
+
+
+handlers =3D {'E': event_handler, 'R': recv_handler, 'S': send_handler}
+
+
+class PacketReceiver(LineReceiver):
+    def __init__(self) -> None:
+        super().__init__()
+
+    def connectionMade(self):
+        print("connected")
+
+    def lineReceived(self, line):
+        # print(line.hex(" "))
+        resp =3D line
+        if len(line) =3D=3D 3:
+            resp =3D handlers[chr(line[0])](line)
+
+        self.sendLine(resp)
+
+
+class PacketReceiverFactory(ClientFactory):
+    protocol =3D PacketReceiver
+
+    def __init__(self):
+        self.done =3D Deferred()
+
+    def clientConnectionFailed(self, connector, reason):
+        print("connection failed:", reason.getErrorMessage())
+        self.done.errback(reason)
+
+    def clientConnectionLost(self, connector, reason):
+        print("connection lost:", reason.getErrorMessage())
+        self.done.callback(None)
+
+
+def main(reactor):
+    dump_mem()
+    factory =3D PacketReceiverFactory()
+    reactor.connectTCP(HOST, PORT, factory)
+    return factory.done
+
+
+if __name__ =3D=3D "__main__":
+    task.react(main)
--
2.34.1


Please consider the environment before printing this e-mail.
________________________________
This e-mail (including any attachments) is intended solely for the use of t=
he individual or entity to which it is addressed and may contain confidenti=
al information. This message is not a binding agreement and does not conclu=
de an agreement without the express confirmation of the sender's superior o=
r a director of the company.
If you are not the intended recipient, you should immediately notify the se=
nder and delete the message along all the attachments. Any disclosure, copy=
ing, distribution or any other action is prohibited and may be illegal. No =
e-mail transmission can be guaranteed to be 100% secure or error-free, as i=
nformation could be intercepted, corrupted, lost, destroyed, arrive late or=
 incomplete, or contain viruses. Although Spyrosoft has taken precautions t=
o ensure that this e-mail is free from viruses, the company does not accept=
 liability for any errors or omissions in the content of this message, whic=
h arise as a result of the e-mail transmission. This e-mail is deemed to be=
 professional in nature. Spyrosoft does not permit the employees to send em=
ails which contravene provisions of the law.

--_000_PAXP193MB16793F753AA32E8FAA831D7B83879PAXP193MB1679EURP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
There is a feature I prepared which may be practical for some QEMU users.<b=
r>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
The feature provides a new I2C slave device&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
that prepares a message depending what i2c-slave callback was called</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted3 ContentPasted4">
and sends it&nbsp;outside of QEMU through the character device to a client<=
br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
that receives that message, processes it and send back a response.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted5 ContentPasted6 ContentPasted8">
Thanks to that&nbsp;feature,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted5 ContentPasted6 ContentPasted8">
a user can emulate a logic of I2C device outside of QEMU.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
The message contains 3 bytes ended with CRLF: BBB\r\l</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Basically, the I2C slave does 4 steps in each i2c-slave callback:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
* encode</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
* send</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
* receive</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
* decode</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted1">
I put more details in esp32_i2c_tcp_slave.c</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted1">
and also provided a demo client in python that uses TCP.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
The feature still needs some improvements, but the question is:<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted2">
*&nbsp;Do you find the feature useful?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted7">
NOTE:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted7">
The feature originally was prepared for espressif/qemu<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted7">
that's why there are references to esp32</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted7">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
Signed-off-by: Karol Nowak &lt;knw@spyro-soft.com&gt;
<div class=3D"ContentPasted0">---</div>
<div class=3D"ContentPasted0">&nbsp;hw/misc/esp32_i2c_tcp_slave.c &nbsp; &n=
bsp; &nbsp; &nbsp; | 288 ++++++++++++++++++++++++++</div>
<div class=3D"ContentPasted0">&nbsp;include/hw/misc/esp32_i2c_tcp_slave.h |=
 &nbsp;19 ++</div>
<div class=3D"ContentPasted0">&nbsp;tests/i2c-tcp-demo/i2c-tcp-demo.py &nbs=
p; &nbsp;| 133 ++++++++++++</div>
<div class=3D"ContentPasted0">&nbsp;3 files changed, 440 insertions(+)</div=
>
<div class=3D"ContentPasted0">&nbsp;create mode 100644 hw/misc/esp32_i2c_tc=
p_slave.c</div>
<div class=3D"ContentPasted0">&nbsp;create mode 100644 include/hw/misc/esp3=
2_i2c_tcp_slave.h</div>
<div class=3D"ContentPasted0">&nbsp;create mode 100644 tests/i2c-tcp-demo/i=
2c-tcp-demo.py</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">diff --git a/hw/misc/esp32_i2c_tcp_slave.c b/=
hw/misc/esp32_i2c_tcp_slave.c</div>
<div class=3D"ContentPasted0">new file mode 100644</div>
<div class=3D"ContentPasted0">index 0000000000..db3b6d366a</div>
<div class=3D"ContentPasted0">--- /dev/null</div>
<div class=3D"ContentPasted0">+++ b/hw/misc/esp32_i2c_tcp_slave.c</div>
<div class=3D"ContentPasted0">@@ -0,0 +1,288 @@</div>
<div class=3D"ContentPasted0">+#include &quot;qemu/osdep.h&quot;</div>
<div class=3D"ContentPasted0">+#include &quot;qemu/error-report.h&quot;</di=
v>
<div class=3D"ContentPasted0">+#include &quot;qemu/log.h&quot;</div>
<div class=3D"ContentPasted0">+#include &quot;hw/i2c/i2c.h&quot;</div>
<div class=3D"ContentPasted0">+#include &quot;hw/irq.h&quot;</div>
<div class=3D"ContentPasted0">+#include &quot;hw/misc/esp32_i2c_tcp_slave.h=
&quot;</div>
<div class=3D"ContentPasted0">+#include &quot;qemu/module.h&quot;</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+#include &quot;qapi/qmp/json-writer.h&quot;<=
/div>
<div class=3D"ContentPasted0">+#include &quot;chardev/char-fe.h&quot;</div>
<div class=3D"ContentPasted0">+#include &quot;io/channel-socket.h&quot;</di=
v>
<div class=3D"ContentPasted0">+#include &quot;chardev/char-io.h&quot;</div>
<div class=3D"ContentPasted0">+#include &quot;chardev/char-socket.h&quot;</=
div>
<div class=3D"ContentPasted0">+#include &quot;qapi/error.h&quot;</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+/*</div>
<div class=3D"ContentPasted0">+ * Description:</div>
<div class=3D"ContentPasted0">+ * To allow to emulate a I2C slave device wh=
ich is not supported by QEMU,</div>
<div class=3D"ContentPasted0">+ * a new I2C slave device was created that e=
ncapsulates I2C operations</div>
<div class=3D"ContentPasted0">+ * and passes them through a selected charde=
v to the host</div>
<div class=3D"ContentPasted0">+ * where a client resides that implements a =
logic of emulated device.</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * Architecture:</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;---------------------------<=
/div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| QEMU &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &=
nbsp; &nbsp; -----------------------</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| &nbsp;ESP32 Firmware write=
s &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| &nbsp;to I2C Slave &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; | I2C Slave Emula=
tion |</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &=
nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; |</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| &nbsp;--------------------=
---&amp;---------&amp;---- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; |</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| &nbsp;| I2C Slave at 0x7F =
&nbsp; &nbsp;&amp; &nbsp; tcp &nbsp; &amp; &nbsp; &nbsp; recv msg &nbsp; &n=
bsp; &nbsp; &nbsp;|</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| &nbsp;--------------------=
---&amp;---------&amp;---- process msg &nbsp; &nbsp; |</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &=
nbsp; &nbsp; | &nbsp; &nbsp; send respone &nbsp; &nbsp;|</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &=
nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; |</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;| &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp; &=
nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; |</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp;--------------------------- =
&nbsp; &nbsp; &nbsp; &nbsp; |----------------------</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * Syntax &amp; protocol:</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp;QEMU I2C Slave sends =
a msg in following format: BBB\r\n</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp;where each 'B' repres=
ents a single byte 0-255</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp;QEMU I2C Slave expect=
s a respone message in the same format as fast as possible</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp;Example:</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; req: 0x45 0x0=
1 0x00 \r\n</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;resp: 0x45 0x0=
1 0x00 \r\n</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp;The format BBB\r\n</d=
iv>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;first 'B' is a=
 message type</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;second 'B' is =
a data value</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;third 'B' is a=
n error value (not used at the moment)</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp;There are three types=
 of message</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;'E' or 0x45 - =
Event:</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;'S' or 0x53 - =
Send: byte sent to emulated I2C Slave</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;'R' or 0x52 - =
Recv: byte to be received by I2C Master</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp;'E' message</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;second byte is=
 an event type:</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; 0x0: I2C_STAR=
T_RECV</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; 0x1: I2C_STAR=
T_SEND</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; 0x2: I2C_STAR=
T_SEND_ASYNC</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; 0x3: I2C_FINI=
SH</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; 0x4: I2C_NACK=
</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;Example:</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
0x45 0x01 0x00 &nbsp;- start send</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
0x45 0x03 0x00 &nbsp;- finish</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;In case of 'E'=
 message, a response is the same as a request message</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp;'S' message</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;second byte is=
 a byte transmitted from I2C Master to I2C slave device</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;the byte to by=
 processed by I2C Slave Device</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;Example:</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
0x53 0x20 0x00</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;In case of 'S'=
 message, a response is the same as a request message</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp;'R' message</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;the I2C Master=
 expect a byte from the emulated i2c slave device</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;A client has t=
o modify the second byte of the request message</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; and send it b=
ack as a response.</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp;Example:</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 req: 0x52 0x00 0x00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
resp: 0x52 0x11 0x00</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * Examples of Transmission:</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; 1) i2cset -c 0x7F -r 0x20 0=
x11 0x22 0x33 0x44 0x55</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 45=
 01 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 45 01 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 53=
 20 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 53 20 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 53=
 11 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 53 11 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 53=
 22 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 53 22 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 53=
 33 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 53 33 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 53=
 44 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 53 44 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 53=
 55 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 53 55 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 45=
 03 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 45 03 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; 2) i2cget -c 0x7F -r 0x20 -=
l 0x03</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 45=
 01 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 45 01 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 53=
 20 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 53 20 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 45=
 03 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 45 03 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 45=
 00 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 45 00 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 52=
 00 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 52 11 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 52=
 00 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 52 22 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 52=
 00 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 52 33 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;req: 45=
 03 00</div>
<div class=3D"ContentPasted0">+ * &nbsp; &nbsp; &nbsp; &nbsp; resp: 45 03 0=
0</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * To start i2c.socket server, set QEMU para=
m:</div>
<div class=3D"ContentPasted0">+ * &nbsp; -chardev socket,port=3D16001,wait=
=3Dno,host=3Dlocalhost,server=3Don,ipv4=3Don,id=3Di2c.socket</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * Simple demo I2C Slave Emulation in Python=
:</div>
<div class=3D"ContentPasted0">+ * &nbsp; tests/i2c-tcp-demo/i2c-tcp-demo.py=
</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ * Limitations:</div>
<div class=3D"ContentPasted0">+ * &nbsp; - there is no recv timeout which m=
ay lead to qemu hang</div>
<div class=3D"ContentPasted0">+ *</div>
<div class=3D"ContentPasted0">+ */</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+#define CHARDEV_NAME &quot;i2c.socket&quot;<=
/div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static Chardev *chardev;</div>
<div class=3D"ContentPasted0">+static CharBackend char_backend;</div>
<div class=3D"ContentPasted0">+static bool chardev_open;</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+typedef struct {</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;uint8_t id;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;uint8_t byte;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;uint8_t err;</div>
<div class=3D"ContentPasted0">+} packet;</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static int chr_can_receive(void *opaque)</di=
v>
<div class=3D"ContentPasted0">+{</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;return CHR_READ_BUF_LEN;</div>
<div class=3D"ContentPasted0">+}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static void chr_event(void *opaque, QEMUChrE=
vent event)</div>
<div class=3D"ContentPasted0">+{</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;switch (event) {</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;case CHR_EVENT_OPENED:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;qemu_log(&quot;c=
onnected\n&quot;);</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;chardev_open =3D=
 true;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;case CHR_EVENT_CLOSED:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;qemu_log(&quot;d=
isconnected\n&quot;);</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;chardev_open =3D=
 false;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;case CHR_EVENT_BREAK:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;case CHR_EVENT_MUX_IN:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;case CHR_EVENT_MUX_OUT:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;/* Ignore */</di=
v>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;break;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">+}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static void send_packet(packet *p)</div>
<div class=3D"ContentPasted0">+{</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;static const char *PACKET_FMT =
=3D &quot;%c%c%c\r\n&quot;;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;static char buff[32];</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;/* encode */</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;int len =3D snprintf(buff, siz=
eof(buff), PACKET_FMT, p-&gt;id, p-&gt;byte, p-&gt;err);</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;/* send */</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;qemu_chr_fe_write_all(&amp;cha=
r_backend, (uint8_t *)buff, len);</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;/* receive */</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;qemu_chr_fe_read_all(&amp;char=
_backend, (uint8_t *)buff, len);</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;/* decode */</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;sscanf(buff, PACKET_FMT, &amp;=
p-&gt;id, &amp;p-&gt;byte, &amp;p-&gt;err);</div>
<div class=3D"ContentPasted0">+}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static uint8_t slave_rx(I2CSlave *i2c)</div>
<div class=3D"ContentPasted0">+{</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;packet p =3D {.id =3D 'R',</di=
v>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;.byte =3D 0,</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;.err =3D 0};</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;send_packet(&amp;p);</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;return p.byte;</div>
<div class=3D"ContentPasted0">+}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static int slave_tx(I2CSlave *i2c, uint8_t d=
ata)</div>
<div class=3D"ContentPasted0">+{</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;packet p =3D {.id =3D 'S',</di=
v>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;.byte =3D data,</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;.err =3D 0};</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;send_packet(&amp;p);</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;return 0;</div>
<div class=3D"ContentPasted0">+}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static int slave_event(I2CSlave *i2c, enum i=
2c_event event)</div>
<div class=3D"ContentPasted0">+{</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;packet p =3D {.id =3D 'E',</di=
v>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;.byte =3D event,</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;.err =3D 0};</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;send_packet(&amp;p);</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;return 0;</div>
<div class=3D"ContentPasted0">+}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static void slave_realize(DeviceState *dev, =
Error **errp)</div>
<div class=3D"ContentPasted0">+{</div>
<div class=3D"ContentPasted0">+}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static void slave_init(Object *obj)</div>
<div class=3D"ContentPasted0">+{</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;Error *err =3D NULL;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;chardev =3D qemu_chr_find(CHAR=
DEV_NAME);</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;if (!chardev) {</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;error_report(&qu=
ot;chardev '%s' not found&quot;, CHARDEV_NAME);</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;if (!qemu_chr_fe_init(&amp;cha=
r_backend, chardev, &amp;err)) {</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;error_report_err=
(err);</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;return;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;qemu_chr_fe_set_handlers(&amp;=
char_backend, chr_can_receive, NULL, chr_event,</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NULL, NULL, NULL, tr=
ue);</div>
<div class=3D"ContentPasted0">+}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static void slave_class_init(ObjectClass *kl=
ass, void *data)</div>
<div class=3D"ContentPasted0">+{</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;DeviceClass *dc =3D DEVICE_CLA=
SS(klass);</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;I2CSlaveClass *k =3D I2C_SLAVE=
_CLASS(klass);</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;dc-&gt;realize =3D slave_reali=
ze;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;k-&gt;event =3D slave_event;</=
div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;k-&gt;recv =3D slave_rx;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;k-&gt;send =3D slave_tx;</div>
<div class=3D"ContentPasted0">+}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static const TypeInfo esp32_i2c_tcp_info =3D=
 {</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;.name =3D TYPE_ESP32_I2C_TCP,<=
/div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;.parent =3D TYPE_I2C_SLAVE,</d=
iv>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;.instance_size =3D sizeof(ESP3=
2_I2C_TCP_State),</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;.instance_init =3D slave_init,=
</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;.class_init =3D slave_class_in=
it,</div>
<div class=3D"ContentPasted0">+};</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+static void esp32_i2c_tcp_type_init(void)</d=
iv>
<div class=3D"ContentPasted0">+{</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;type_register_static(&amp;esp3=
2_i2c_tcp_info);</div>
<div class=3D"ContentPasted0">+}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+type_init(esp32_i2c_tcp_type_init);</div>
<div class=3D"ContentPasted0">diff --git a/include/hw/misc/esp32_i2c_tcp_sl=
ave.h b/include/hw/misc/esp32_i2c_tcp_slave.h</div>
<div class=3D"ContentPasted0">new file mode 100644</div>
<div class=3D"ContentPasted0">index 0000000000..e36bac7ffe</div>
<div class=3D"ContentPasted0">--- /dev/null</div>
<div class=3D"ContentPasted0">+++ b/include/hw/misc/esp32_i2c_tcp_slave.h</=
div>
<div class=3D"ContentPasted0">@@ -0,0 +1,19 @@</div>
<div class=3D"ContentPasted0">+/*</div>
<div class=3D"ContentPasted0">+ */</div>
<div class=3D"ContentPasted0">+#ifndef QEMU_ESP32_I2C_TCP_SLAVE_H</div>
<div class=3D"ContentPasted0">+#define QEMU_ESP32_I2C_TCP_SLAVE_H</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+#include &quot;hw/i2c/i2c.h&quot;</div>
<div class=3D"ContentPasted0">+#include &quot;qom/object.h&quot;</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+#define TYPE_ESP32_I2C_TCP &quot;esp32_i2c_t=
cp&quot;</div>
<div class=3D"ContentPasted0">+OBJECT_DECLARE_SIMPLE_TYPE(ESP32_I2C_TCP_Sta=
te, ESP32_I2C_TCP)</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+/**</div>
<div class=3D"ContentPasted0">+ */</div>
<div class=3D"ContentPasted0">+struct ESP32_I2C_TCP_State {</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;/*&lt; private &gt;*/</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;I2CSlave i2c;</div>
<div class=3D"ContentPasted0">+};</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+#endif</div>
<div class=3D"ContentPasted0">diff --git a/tests/i2c-tcp-demo/i2c-tcp-demo.=
py b/tests/i2c-tcp-demo/i2c-tcp-demo.py</div>
<div class=3D"ContentPasted0">new file mode 100644</div>
<div class=3D"ContentPasted0">index 0000000000..d4bec457f3</div>
<div class=3D"ContentPasted0">--- /dev/null</div>
<div class=3D"ContentPasted0">+++ b/tests/i2c-tcp-demo/i2c-tcp-demo.py</div=
>
<div class=3D"ContentPasted0">@@ -0,0 +1,133 @@</div>
<div class=3D"ContentPasted0">+import json</div>
<div class=3D"ContentPasted0">+from twisted.internet import task</div>
<div class=3D"ContentPasted0">+from twisted.internet.defer import Deferred<=
/div>
<div class=3D"ContentPasted0">+from twisted.internet.protocol import Client=
Factory</div>
<div class=3D"ContentPasted0">+from twisted.protocols.basic import LineRece=
iver</div>
<div class=3D"ContentPasted0">+from dataclasses import dataclass</div>
<div class=3D"ContentPasted0">+from enum import Enum</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+# i2cset -c 0x7F -r 0x20 0x11 0x22 0x33 0x44=
 0x55</div>
<div class=3D"ContentPasted0">+# i2cget -c 0x7F -r 0x20 -l 0x0A</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+HOST =3D &quot;localhost&quot;</div>
<div class=3D"ContentPasted0">+PORT =3D 16001</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+class EVENT(Enum):</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;I2C_START_RECV =3D 0</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;I2C_START_SEND =3D 1</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;I2C_START_SEND_ASYNC =3D 2</di=
v>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;I2C_FINISH =3D 3</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;I2C_NACK =3D 4</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+@dataclass</div>
<div class=3D"ContentPasted0">+class I2CSlave:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;mem: bytearray =3D bytearray(2=
56)</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;mem_addr: int =3D 0</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;curr_addr: int =3D 0</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;first_send: bool =3D True</div=
>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;recv_conuter: int =3D 0</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+i2cslave =3D I2CSlave()</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+def dump_mem():</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;print(&quot;Mem:&quot;)</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;bytes_per_row =3D 32</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;rows =3D int(256 / bytes_per_r=
ow)</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;for i in range(0, rows):</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;begin =3D i*byte=
s_per_row</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;end =3D begin+by=
tes_per_row</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;prefix =3D hex(b=
egin)</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;if i =3D=3D 0:</=
div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pr=
efix =3D &quot;0x00&quot;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;print(prefix + &=
quot;: &quot; + i2cslave.mem[begin:end].hex(&quot; &quot;))</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;print(&quot;\n&quot;)</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+def event_handler(packet):</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;evt =3D EVENT(packet[1])</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;print(&quot;Event handler: &qu=
ot; + evt.name)</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;if evt is EVENT.I2C_FINISH:</d=
iv>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;i2cslave.recv_co=
nuter =3D 0</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;i2cslave.first_s=
end =3D True</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;dump_mem()</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;return packet</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+def recv_handler(packet):</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;print(&quot;Recv handler: byte=
 number &quot; + str(i2cslave.recv_conuter) +</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot; fr=
om addr=3D&quot; + hex(i2cslave.mem_addr) +</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;, v=
al=3D&quot; + hex(i2cslave.mem[i2cslave.mem_addr]))</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;i2cslave.recv_conuter +=3D 1</=
div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;resp =3D bytearray(packet)</di=
v>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;resp[1] =3D i2cslave.mem[i2csl=
ave.mem_addr]</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;i2cslave.mem_addr +=3D 1</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;if i2cslave.mem_addr =3D=3D 25=
6:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;i2cslave.mem_add=
r =3D 0</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;return bytes(resp)</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+def send_handler(packet):</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;print(&quot;Send handler: &quo=
t;, end=3D'')</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;if i2cslave.first_send =3D=3D =
True:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;print(&quot;addr=
ess byte: &quot;, hex(packet[1]))</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;i2cslave.mem_add=
r =3D packet[1]</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;i2cslave.first_s=
end =3D False</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;else:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;print(&quot;data=
 byte: &quot;, hex(packet[1]))</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;i2cslave.mem[i2c=
slave.mem_addr] =3D packet[1]</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;i2cslave.mem_add=
r +=3D 1</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;if i2cslave.mem_=
addr =3D=3D 256:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;i2=
cslave.mem_addr =3D 0</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;return packet</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+handlers =3D {'E': event_handler, 'R': recv_=
handler, 'S': send_handler}</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+class PacketReceiver(LineReceiver):</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;def __init__(self) -&gt; None:=
</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;super().__init__=
()</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;def connectionMade(self):</div=
>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;print(&quot;conn=
ected&quot;)</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;def lineReceived(self, line):<=
/div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;# print(line.hex=
(&quot; &quot;))</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;resp =3D line</d=
iv>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;if len(line) =3D=
=3D 3:</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;re=
sp =3D handlers[chr(line[0])](line)</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;self.sendLine(re=
sp)</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+class PacketReceiverFactory(ClientFactory):<=
/div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;protocol =3D PacketReceiver</d=
iv>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;def __init__(self):</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;self.done =3D De=
ferred()</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;def clientConnectionFailed(sel=
f, connector, reason):</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;print(&quot;conn=
ection failed:&quot;, reason.getErrorMessage())</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;self.done.errbac=
k(reason)</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;def clientConnectionLost(self,=
 connector, reason):</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;print(&quot;conn=
ection lost:&quot;, reason.getErrorMessage())</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;self.done.callba=
ck(None)</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+def main(reactor):</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;dump_mem()</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;factory =3D PacketReceiverFact=
ory()</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;reactor.connectTCP(HOST, PORT,=
 factory)</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;return factory.done</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+</div>
<div class=3D"ContentPasted0">+if __name__ =3D=3D &quot;__main__&quot;:</di=
v>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp;task.react(main)</div>
<div class=3D"ContentPasted0">-- </div>
<div class=3D"ContentPasted0">2.34.1</div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof"><br class=3D"ContentPasted0">
</div>
</div>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<title>Email Signature</title>
<table style=3D"WIDTH: 515px; FONT-SIZE: 7pt; FONT-FAMILY: ARIAL" cellpaddi=
ng=3D"0" cellspacing=3D"0">
<tbody>
<tr>
<td style=3D"FONT-SIZE: 7pt; FONT-FAMILY: Arial; PADDING-TOP: 10px; vertica=
l-align:top;" valign=3D"top" colspan=3D"2">
<div style=3D"color:#454545; FONT-SIZE: 7pt; FONT-FAMILY: Arial; text-align=
:justify; width:514px;" align=3D"justify">
Please consider the environment before printing this e-mail.
<hr style=3D"background-color:#1b75bc;overflow:visible;height:1px">
This e-mail (including any attachments) is intended solely for the use of t=
he individual or entity to which it is addressed and may contain confidenti=
al information. This message is not a binding agreement and does not conclu=
de an agreement without the express
 confirmation of the sender&#8217;s superior or a director of the company.<=
br>
If you are not the intended recipient, you should immediately notify the se=
nder and delete the message along all the attachments. Any disclosure, copy=
ing, distribution or any other action is prohibited and may be illegal. No =
e-mail transmission can be guaranteed
 to be 100% secure or error-free, as information could be intercepted, corr=
upted, lost, destroyed, arrive late or incomplete, or contain viruses. Alth=
ough Spyrosoft has taken precautions to ensure that this e-mail is free fro=
m viruses, the company does not
 accept liability for any errors or omissions in the content of this messag=
e, which arise as a result of the e-mail transmission. This e-mail is deeme=
d to be professional in nature. Spyrosoft does not permit the employees to =
send emails which contravene provisions
 of the law. </div>
</td>
</tr>
</tbody>
</table>
</body>
</html>

--_000_PAXP193MB16793F753AA32E8FAA831D7B83879PAXP193MB1679EURP_--

