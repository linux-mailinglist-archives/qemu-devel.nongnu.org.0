Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60FC80245
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 23:35:23 +0200 (CEST)
Received: from localhost ([::1]:37672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htfCs-00064A-DX
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 17:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48028)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1htfBh-0005bz-Q2
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 17:34:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1htfBf-0005dS-SM
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 17:34:09 -0400
Received: from mga09.intel.com ([134.134.136.24]:28642)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1htfBf-0005bg-FL
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 17:34:07 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 14:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,339,1559545200"; d="scan'208";a="373076313"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga006.fm.intel.com with ESMTP; 02 Aug 2019 14:34:04 -0700
Date: Sat, 3 Aug 2019 05:33:40 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190802213340.GA25611@richard>
References: <20190802020716.11985-1-richardw.yang@linux.intel.com>
 <87a7csm965.fsf@dusky.pond.sub.org>
 <20190802054338.GA15295@richard> <20190802100220.GE2899@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190802100220.GE2899@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-devel] [PATCH] hmp/info_migration: formatting migration
 capability output
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 02, 2019 at 11:02:20AM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> On Fri, Aug 02, 2019 at 07:24:34AM +0200, Markus Armbruster wrote:
>> >Subject doesn't quite conform to conventions.  Suggest
>> >
>> >    hmp: Improve how "info migrate" formats capabilities
>> 
>> Thanks
>> 
>> >
>> >Wei Yang <richardw.yang@linux.intel.com> writes:
>> >
>> >> Current we put all migration capability in one line, which make it hard
>> >> to read them and someone them are missed due to terminal width.
>> >>
>> >> This patch formats it to print 4 in one line, which looks like this now:
>> >>
>> >> capabilities:
>> >>               xbzrle: off         rdma-pin-all: off        auto-converge: off          zero-blocks: off
>> >>             compress:  on               events: off         postcopy-ram: off               x-colo: off
>> >>          release-ram: off                block: off          return-path: off pause-before-switchover: off
>> >>              multifd: off        dirty-bitmaps: off   postcopy-blocktime: off  late-block-activate: off
>> >>      x-ignore-shared: off
>> >>
>> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> >> ---
>> >>  monitor/hmp-cmds.c | 8 ++++++--
>> >>  1 file changed, 6 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>> >> index 5ca3ebe942..29ce5b73e4 100644
>> >> --- a/monitor/hmp-cmds.c
>> >> +++ b/monitor/hmp-cmds.c
>> >> @@ -229,9 +229,13 @@ void hmp_info_migrate(Monitor *mon, const QDict *qdict)
>> >>  
>> >>      /* do not display parameters during setup */
>> >>      if (info->has_status && caps) {
>> >> +        int index = 0;
>> >>          monitor_printf(mon, "capabilities: ");
>> >> -        for (cap = caps; cap; cap = cap->next) {
>> >> -            monitor_printf(mon, "%s: %s ",
>> >> +        for (cap = caps; cap; cap = cap->next, index++) {
>> >> +            if (!(index % 4)) {
>> >> +                monitor_printf(mon, "\n");
>> >> +            }
>> >> +            monitor_printf(mon, "%20s: %3s ",
>> >>                             MigrationCapability_str(cap->value->capability),
>> >>                             cap->value->state ? "on" : "off");
>> >>          }
>> >
>> >This assumes migration capability names are at most 20 characters long.
>> >late-block-activate is pushing it already: 19 characters.
>> >
>> >It adds up to 104 characters per line, which is rather wide.
>> >
>> >What about putting each capability on its own line, just like globals,
>> >and just like "info migrate_capabilities"?
>> >
>> >(qemu) info migrate
>> >globals:
>> >store-global-state: on
>> >only-migratable: off
>> >send-configuration: on
>> >send-section-footer: on
>> >decompress-error-check: on
>> >clear-bitmap-shift: 18
>> >capabilities:
>> >xbzrle: off
>> >rdma-pin-all: off
>> >auto-converge: off
>> >[...]
>> 
>> This looks good, while would reader may feel difficult to clarify from which
>> one the capabilities stops. 
>> 
>> How about add 4 space at the beginning of each capability?
>> 
>> Would the output be too long? How about wrap two capability into one line?
>
>IMHO the simpler way is just not to display the capabilities on
>'info migrate' at all.  If people want the list of capabilities there's
>already 'info migrate_capabiltiies' they can use.
>
>It was nice displaying them at the start of 'info migrate'
>when we only had a few, but nowe we've got so many it's perhaps
>easier just to omit them.
>

Got it.

>Dave
>
>> -- 
>> Wei Yang
>> Help you, Help me
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- 
Wei Yang
Help you, Help me

