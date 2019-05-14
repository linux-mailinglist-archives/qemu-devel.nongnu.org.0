Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B5E1C987
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 15:42:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQXgz-0000cC-GY
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 09:42:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQXfq-0000IW-UM
	for qemu-devel@nongnu.org; Tue, 14 May 2019 09:40:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1hQXfq-00032a-2U
	for qemu-devel@nongnu.org; Tue, 14 May 2019 09:40:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52524)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hQXfp-00031d-TW
	for qemu-devel@nongnu.org; Tue, 14 May 2019 09:40:54 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 868093086235;
	Tue, 14 May 2019 13:40:47 +0000 (UTC)
Received: from work-vm (ovpn-117-232.ams2.redhat.com [10.36.117.232])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F2F360F81;
	Tue, 14 May 2019 13:40:46 +0000 (UTC)
Date: Tue, 14 May 2019 14:40:44 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190514134040.GA9618@work-vm>
References: <20190403011016.12549-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190403011016.12549-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 14 May 2019 13:40:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] vmstate: check subsection_found is
 enough
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> subsection_found is true implies vmdesc is not NULL.
> 
> This patch remove the additional check on vmdesc and rename
> subsection_found to vmdesc_has_subsections to make it more self-explain.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Queued.

> ---
> v2:
>   * rename it to vmdesc_has_subsections
> ---
>  migration/vmstate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index e2bbb7b5f7..1305d1a528 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -496,7 +496,7 @@ static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
>                                     void *opaque, QJSON *vmdesc)
>  {
>      const VMStateDescription **sub = vmsd->subsections;
> -    bool subsection_found = false;
> +    bool vmdesc_has_subsections = false;
>      int ret = 0;
>  
>      trace_vmstate_subsection_save_top(vmsd->name);
> @@ -508,9 +508,9 @@ static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
>              trace_vmstate_subsection_save_loop(vmsd->name, vmsdsub->name);
>              if (vmdesc) {
>                  /* Only create subsection array when we have any */
> -                if (!subsection_found) {
> +                if (!vmdesc_has_subsections) {
>                      json_start_array(vmdesc, "subsections");
> -                    subsection_found = true;
> +                    vmdesc_has_subsections = true;
>                  }
>  
>                  json_start_object(vmdesc, NULL);
> @@ -533,7 +533,7 @@ static int vmstate_subsection_save(QEMUFile *f, const VMStateDescription *vmsd,
>          sub++;
>      }
>  
> -    if (vmdesc && subsection_found) {
> +    if (vmdesc_has_subsections) {
>          json_end_array(vmdesc);
>      }
>  
> -- 
> 2.19.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

