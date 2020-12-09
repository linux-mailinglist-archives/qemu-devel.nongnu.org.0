Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654302D487B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 19:02:12 +0100 (CET)
Received: from localhost ([::1]:33006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn3n1-0003fZ-Br
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 13:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1kn3e4-0004Um-QH
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:52:58 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jejb@linux.ibm.com>)
 id 1kn3e0-0002w2-S6
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:52:56 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B9HZPYS181786; Wed, 9 Dec 2020 12:52:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=zgWxL1ZUtOeE2wmG4QM/hocX+x0GGDgxz+BNubR2f84=;
 b=mXo29n3r1kCVTgNrWQGzrQjJnZHUEdzl484IvmWfpw3bqDANxvxkF38IlL18uLQuTcPj
 M9a6WlT/mgsbIXec6Q2zqhSM/bs21KzBezzpRklbHhcNI5wl9tbkAig3ZjR4yLfQWRyC
 1yGueV4t2UV0XCgzSXaaQxdBlVfkOJHLAHXgXgtHOlSzm5yPXKLsmc1/b7/cYMIQ5GS/
 z0lOd5PGON1PJel5V69YgQajvxr2vezkQCAgdL6JiN9hOx+1iUFWapZ7MTI9Lk4UajMu
 BBpSVeoJaPdy557RTyoK4umi5GiklJBtGUQxJZzvnH/QdjzVrUoxwGVTVmhntHkgzF6C vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35avp1k9er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:52:48 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B9HZrgA182617;
 Wed, 9 Dec 2020 12:52:47 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35avp1k9ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 12:52:47 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HqZ3o027073;
 Wed, 9 Dec 2020 17:52:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 3581u9hknn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 17:52:46 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B9HqhPn24707336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 17:52:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDF2A7805C;
 Wed,  9 Dec 2020 17:52:42 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A523078060;
 Wed,  9 Dec 2020 17:52:40 +0000 (GMT)
Received: from jarvis.int.hansenpartnership.com (unknown [9.85.183.17])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  9 Dec 2020 17:52:40 +0000 (GMT)
Message-ID: <028f4a3c7e80a829c6cd7d34749c3525531b20db.camel@linux.ibm.com>
Subject: Re: [PATCH 0/3] sev: enable seret injection to a self described
 area in OVMF
From: James Bottomley <jejb@linux.ibm.com>
To: qemu-devel@nongnu.org
Date: Wed, 09 Dec 2020 09:52:39 -0800
In-Reply-To: <20201209172334.14100-1-jejb@linux.ibm.com>
References: <20201209172334.14100-1-jejb@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_14:2020-12-09,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090124
Received-SPF: pass client-ip=148.163.156.1; envelope-from=jejb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: jejb@linux.ibm.com
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, jon.grimm@amd.com, tobin@ibm.com, frankeh@us.ibm.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, dovmurik@linux.vnet.ibm.com,
 Dov.Murik1@il.ibm.com, pbonzini@redhat.com, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-12-09 at 09:23 -0800, James Bottomley wrote:
> This patch series includes one from Tobin that has already been
> posted
> and reviewed:
> 
> https://lore.kernel.org/qemu-devel/20201027170303.47550-1-tobin@linux.ibm.com/
> 
> I'm adding it here because it's a required precursor, but it can be
> dropped from this series if it's already being upstreamed elsewhere.
> 
> The remaining two patches introduce a parser for the optional OVMF
> description table which is placed just below the reset vector (the
> format of the table is described in the patch itself) and also adds a
> hook to pull out the description of the SEV secret area location and
> use it in place of the sev-inject-launch-secret gpa.

For those who want to try this at home (assuming you have a SEV capable
AMD system), you need the amd sev-tool:

https://github.com/AMDESE/sev-tool/

To build the launch bundle (which contains the TIK and TEK key pair). 
Once you have that, you need to pass in both the launch bundle and the
-S flag to get QEMU to pause before starting the VM to allow
measurement and secret injection.  I'm using the python script below to
interact with the paused VM, verify the measurement, inject the secret
and resume the VM.  The below python script uses qmp.py from the qemu
git repository, so you'll have to adjust your path to it.

James

---

#!/usr/bin/python3
##
# Python script to inject a secret disk password into a paused SEV VM
#  (to pause the VM start with -S option)
#
# This assumes you've already created the launch bundle using sev-tool
# from https://github.com/AMDESE/sev-tool.git
#
# sev-tool --generate_launch_blob
#
# creates several files, the only one this script needs is the TIK and TEK
# keys which are stored in tmp_tk.bin
#
# Once TIK/TEK are known, the script will probe the VM for the sev
# parameters needed to calculate the launch measure, retrieve the launch
# measure and verify against the measure calculated from the OVMF hash
# and if that matches create the secret bundle and inject it
#
# Tables and chapters refer to the amd 55766.pdf document
#
# https://www.amd.com/system/files/TechDocs/55766_SEV-KM_API_Specification.pdf
##
import sys
import os 
import base64
import hmac
import hashlib
from argparse import ArgumentParser
from uuid import UUID
from Crypto.Cipher import AES
from Crypto.Util import Counter
from git.qemu.python.qemu import qmp

if __name__ == "__main__":
    parser = ArgumentParser(description='Inject secret into SEV')
    parser.add_argument('--tiktek-file',
                        help='file where sev-tool stored the TIK/TEK combination, defaults to tmp_tk.bin',
                        default='tmp_tk.bin')
    parser.add_argument('--passwd',
                        help='Disk Password',
                        required=True)
    parser.add_argument('--ovmf-hash',
                        help='hash of OVMF firmware blob in hex')
    parser.add_argument('--ovmf-file',
                        help='location of OVMF file to calculate hash from')
    parser.add_argument('--socket',
                        help='Socket to connect to QMP on, defaults to localhost:6550',
                        default='localhost:6550')
    args = parser.parse_args()

    if (args.ovmf_file):
        fh = open (args.ovmf_file, 'rb')
        h = hashlib.sha256(fh.read())
        ovmf_hash = h.digest()
    elif (args.ovmf_hash):
        ovmf_hash = bytearray.fromhex(args.ovmf_hash)
    else:
        parser.error('one of --ovmf-hash or -ovmf-file must be specified')

    if (args.socket[0] == '/'):
        socket = args.socket
    elif (':' in args.socket):
        s = args.socket.split(':')
        socket = (s[0], int(s[1]))
    else:
        parse.error('--socket must be <host>:<port> or /path/to/unix')

    fh=open(args.tiktek_file, 'rb')
    tiktek=bytearray(fh.read())
    fh.close()

    ##
    #  tiktek file is just two binary aes128 keys
    ##
    TEK=tiktek[0:16]
    TIK=tiktek[16:32]

    disk_secret = args.passwd

    Qmp = qmp.QEMUMonitorProtocol(address=socket);
    Qmp.connect()
    caps = Qmp.command('query-sev')
    print('SEV query found API={api-major}.{api-minor} build={build-id} policy={policy}'.format(**caps))
    h = hmac.new(TIK, digestmod='sha256');

    ##
    # calculated per section 6.5.2
    ##
    h.update(bytes([0x04]))
    h.update(caps['api-major'].to_bytes(1,byteorder='little'))
    h.update(caps['api-minor'].to_bytes(1,byteorder='little'))
    h.update(caps['build-id'].to_bytes(1,byteorder='little'))
    h.update(caps['policy'].to_bytes(4,byteorder='little'))
    h.update(ovmf_hash)

    print('\nGetting Launch Measurement')
    meas = Qmp.command('query-sev-launch-measure')
    launch_measure = base64.b64decode(meas['data'])

    ##
    # returned data per Table 52. LAUNCH_MEASURE Measurement Buffer
    ##
    nonce = launch_measure[32:48]
    h.update(nonce)
    measure = launch_measure[0:32]

    print('Measure:   ', measure.hex())
    print('should be: ', h.digest().hex())
    print('')

    if (measure != h.digest()):
        sys.exit('Measurement doesn\'t match')

    print('Measurement matches, Injecting Secret')

    ##
    # construct the secret table: two guids + 4 byte lengths plus string
    # and zero terminator
    #
    # Secret layout is  guid, len (4 bytes), data
    # with len being the length from start of guid to end of data
    #
    # The table header covers the entire table then each entry covers
    # only its local data
    #
    # our current table has the header guid with total table length
    # followed by the secret guid with the zero terminated secret 
    ##
    
    # total length of table: header plus one entry with trailing \0
    l = 16 + 4 + 16 + 4 + len(disk_secret) + 1
    secret = bytearray(l);
    secret[0:16] = UUID('{1e74f542-71dd-4d66-963e-ef4287ff173b}').bytes_le
    secret[16:20] = len(secret).to_bytes(4, byteorder='little')
    secret[20:36] = UUID('{736869e5-84f0-4973-92ec-06879ce3da0b}').bytes_le
    secret[36:40] = (16 + 4 + len(disk_secret) + 1).to_bytes(4, byteorder='little')
    secret[40:40+len(disk_secret)] = disk_secret.encode()
    
    ##
    # encrypt the secret table with the TEK in ctr mode using a random IV
    ##
    IV=os.urandom(16)
    # -EKNUCKLEHEADS in python crypto don't understand CTR mode
    e = AES.new(TEK, AES.MODE_CTR, counter=Counter.new(128,initial_value=int.from_bytes(IV, byteorder='big')));
    encrypted_secret = e.encrypt(bytes(secret))

    ##
    # ultimately needs to be an argument, but there's only
    # compressed and no real use case
    ##
    FLAGS = 0

    ##
    # Table 55. LAUNCH_SECRET Packet Header Buffer
    ##
    header=bytearray(52);
    header[0:4]=FLAGS.to_bytes(4,byteorder='little')
    header[4:20]=IV
    h = hmac.new(TIK, digestmod='sha256');
    h.update(bytes([0x01]))
    # FLAGS || IV
    h.update(header[0:20])
    h.update(l.to_bytes(4, byteorder='little'))
    h.update(l.to_bytes(4, byteorder='little'))
    h.update(encrypted_secret)
    h.update(measure)
    header[20:52]=h.digest()

    Qmp.command('sev-inject-launch-secret',
                **{'packet-header': base64.b64encode(header).decode(),
                   'secret': base64.b64encode(encrypted_secret).decode()
                })

    print('\nSecret Injection Successful, starting VM')

    Qmp.command('cont')


