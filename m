Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6FBEEAA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 04:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLI85-0006mX-UZ
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 22:04:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <brogers@suse.com>) id 1hLI6o-00067T-PS
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 22:03:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <brogers@suse.com>) id 1hLI6n-0000iM-Ez
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 22:03:02 -0400
Received: from prv-mh.provo.novell.com ([137.65.248.74]:34188)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <brogers@suse.com>) id 1hLI6m-0000gw-Ve
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 22:03:01 -0400
Received: from INET-PRV-MTA by prv-mh.provo.novell.com
	with Novell_GroupWise; Mon, 29 Apr 2019 20:02:55 -0600
Message-Id: <5CC7AD36020000480009D802@prv-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 20:04:38 -0600
From: "Bruce Rogers" <brogers@suse.com>
To: <qemu-devel@nongnu.org>,<eblake@redhat.com>
References: <20190429235109.20307-1-brogers@suse.com>
	<3dd36ff4-b51f-fde0-7665-f9ad4eda9194@redhat.com>
In-Reply-To: <3dd36ff4-b51f-fde0-7665-f9ad4eda9194@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 137.65.248.74
Subject: Re: [Qemu-devel] [PATCH] scsi-disk: handle invalid cdb length
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "fam@euphon.net" <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> On 4/29/2019 at 7:37 PM, Eric Blake <eblake@redhat.com> wrote:
> On 4/29/19 6:51 PM, Bruce Rogers wrote:
>> While investigating link-time-optimization, the compiler flagged this
>> case of not handling the error return from scsi_cdb_length(). Handle
>> this error case with a trace report.
>>=20
>> Signed-off-by: Bruce Rogers <brogers@suse.com>
>> ---
>>  hw/scsi/scsi-disk.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>=20
>> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
>> index e7e865ab3b..dc13c892ef 100644
>> --- a/hw/scsi/scsi-disk.c
>> +++ b/hw/scsi/scsi-disk.c
>> @@ -2520,6 +2520,10 @@ static void scsi_disk_new_request_dump(uint32_t =
lun,=20
> uint32_t tag, uint8_t *buf)
>>      int len =3D scsi_cdb_length(buf);
>>      char *line_buffer, *p;
>> =20
>> +    if (len < 0) {
>> +        trace_scsi_disk_new_request(lun, tag, "bad cdb length!");
>=20
> I'd drop the !. We aren't shouting at the trace clients, after all :)

Got it.

Bruce


