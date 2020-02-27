Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F06171B38
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 15:00:43 +0100 (CET)
Received: from localhost ([::1]:60182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7JiU-0000Ee-TO
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 09:00:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1j7Jgh-0007jn-E9
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:58:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1j7Jgg-00078d-Bh
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:58:51 -0500
Received: from 3.mo68.mail-out.ovh.net ([46.105.58.60]:55681)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1j7Jgg-00074v-5M
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:58:50 -0500
Received: from player779.ha.ovh.net (unknown [10.108.35.95])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 1876415D998
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 14:58:38 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 1A4A1FCECA56;
 Thu, 27 Feb 2020 13:58:31 +0000 (UTC)
Date: Thu, 27 Feb 2020 14:58:29 +0100
From: Greg Kurz <groug@kaod.org>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Subject: Re: [PATCH v2] spapr: Fix Coverity warning while validating nvdimm
 options
Message-ID: <20200227145829.56c28da0@bahia.home>
In-Reply-To: <158281096564.89540.4507375445765515529.stgit@lep8c.aus.stglabs.ibm.com>
References: <158281096564.89540.4507375445765515529.stgit@lep8c.aus.stglabs.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14631632243308271957
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrleeigdeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.58.60
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
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, qemu-ppc@nongnu.org,
 f4bug@amsat.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 27 Feb 2020 07:42:49 -0600
Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:

> Fixes Coverity issue,
>       CID 1419883:  Error handling issues  (CHECKED_RETURN)
>            Calling "qemu_uuid_parse" without checking return value
> 
> nvdimm_set_uuid() already verifies if the user provided uuid is valid or
> not. So, need to check for the validity during pre-plug validation again.
> 
> As this a false positive in this case, assert if not valid to be safe.
> Also, error_abort if QOM accessor encounters error while fetching the uuid
> property.
> 
> Reported-by: Coverity (CID 1419883)
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---

You should theoretically add the list of changes since the previous
version but fortunately the patch is simple enough to figure this
out :)

LGTM

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_nvdimm.c |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index 74eeb8bb74..25be8082d7 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -35,6 +35,7 @@ void spapr_nvdimm_validate_opts(NVDIMMDevice *nvdimm, uint64_t size,
>  {
>      char *uuidstr = NULL;
>      QemuUUID uuid;
> +    int ret;
>  
>      if (size % SPAPR_MINIMUM_SCM_BLOCK_SIZE) {
>          error_setg(errp, "NVDIMM memory size excluding the label area"
> @@ -43,8 +44,10 @@ void spapr_nvdimm_validate_opts(NVDIMMDevice *nvdimm, uint64_t size,
>          return;
>      }
>  
> -    uuidstr = object_property_get_str(OBJECT(nvdimm), NVDIMM_UUID_PROP, NULL);
> -    qemu_uuid_parse(uuidstr, &uuid);
> +    uuidstr = object_property_get_str(OBJECT(nvdimm), NVDIMM_UUID_PROP,
> +                                      &error_abort);
> +    ret = qemu_uuid_parse(uuidstr, &uuid);
> +    g_assert(!ret);
>      g_free(uuidstr);
>  
>      if (qemu_uuid_is_null(&uuid)) {
> 


