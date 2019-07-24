Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFFE7314E
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 16:14:00 +0200 (CEST)
Received: from localhost ([::1]:51994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqI1n-0006ND-Dy
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 10:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53689)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <drjones@redhat.com>) id 1hqI1Z-0005td-HA
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:13:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1hqI1X-0002kl-Nh
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:13:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46450)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1hqI1T-0002hj-Pn; Wed, 24 Jul 2019 10:13:39 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D9105308A958;
 Wed, 24 Jul 2019 14:13:38 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E9A5C60BF3;
 Wed, 24 Jul 2019 14:13:34 +0000 (UTC)
Date: Wed, 24 Jul 2019 16:13:32 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190724141332.6tjtzf7ainnz4l7o@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-4-drjones@redhat.com>
 <fec0d7af-a25f-2395-64df-79f2de9579d9@redhat.com>
 <20190626132627.oh2d3qteemgqb6u2@kamzik.brq.redhat.com>
 <7c5df913-1615-b28e-d512-7c71d015a3be@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c5df913-1615-b28e-d512-7c71d015a3be@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 24 Jul 2019 14:13:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 03/14] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 24, 2019 at 02:55:39PM +0200, Auger Eric wrote:
> Hi,
> On 6/26/19 3:26 PM, Andrew Jones wrote:
> > On Wed, Jun 26, 2019 at 09:43:09AM +0200, Auger Eric wrote:
> >> Hi Drew,
> >>
> >> On 6/21/19 6:34 PM, Andrew Jones wrote:
> >>> Add support for the query-cpu-model-expansion QMP command to Arm. We
> >>> do this selectively, only exposing CPU properties which represent
> >>> optional CPU features which the user may want to enable/disable. Also,
> >>> for simplicity, we restrict the list of queryable cpu models to 'max',
> >>> 'host', or the current type when KVM is in use, even though there
> >>> may exist KVM hosts where other types would also work. For example on a
> >>> seattle you could use 'host' for the current type, but then attempt to
> >>> query 'cortex-a57', which is also a valid CPU type to use with KVM on
> >>> seattle hosts, but that query will fail with our simplifications. This
> >>> shouldn't be an issue though as management layers and users have been
> >>> preferring the 'host' CPU type for use with KVM for quite some time.
> >>> Additionally, if the KVM-enabled QEMU instance running on a seattle
> >>> host is using the cortex-a57 CPU type, then querying 'cortex-a57' will
> >>> work. Finally, we only implement expansion type 'full', as Arm does not
> >>> yet have a "base" CPU type. Below are some example calls and results
> >>> (to save character clutter they're not in json, but are still json-ish
> >>> to give the idea)
> >>>
> >>>  # expand the 'max' CPU model
> >>>  query-cpu-model-expansion: type:full, model:{ name:max }
> >>>
> >>>  return: model:{ name:max, props:{ 'aarch64': true, 'pmu': true }}
> >>>
> >>>  # attempt to expand the 'max' CPU model with pmu=off
> >>>  query-cpu-model-expansion:
> >>>    type:full, model:{ name:max, props:{ 'pmu': false }}
> >>>
> >>>  return: model:{ name:max, props:{ 'aarch64': true, 'pmu': false }}
> >>>
> >>>  # attempt to expand the 'max' CPU model with aarch64=off
> >>>  query-cpu-model-expansion:
> >>>    type:full, model:{ name:max, props:{ 'aarch64': false }}
> >>>
> >>>  error: "'aarch64' feature cannot be disabled unless KVM is enabled
> >>>          and 32-bit EL1 is supported"
> >>>
> >>> In the last example KVM was not in use so an error was returned.
> >>>
> >>> Note1: It's possible for features to have dependencies on other
> >>> features. I.e. it may be possible to change one feature at a time
> >>> without error, but when attempting to change all features at once
> >>> an error could occur depending on the order they are processed. It's
> >>> also possible changing all at once doesn't generate an error, because
> >>> a feature's dependencies are satisfied with other features, but the
> >>> same feature cannot be changed independently without error. For these
> >>> reasons callers should always attempt to make their desired changes
> >>> all at once in order to ensure the collection is valid.
> >>>
> >>> Note2: Certainly more features may be added to the list of
> >>> advertised features, e.g. 'vfp' and 'neon'. The only requirement
> >>> is that their property set accessors fail when invalid
> >>> configurations are detected. For vfp we would need something like
> >>>
> >>>  set_vfp()
> >>>  {
> >>>    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
> >>>        cpu->has_vfp != cpu->has_neon)
> >>>        error("AArch64 CPUs must have both VFP and Neon or neither")
> >>>
> >>> in its set accessor, and the same for neon, rather than doing that
> >>> check at realize time, which isn't executed at qmp query time.
> >>>
> >>> Signed-off-by: Andrew Jones <drjones@redhat.com>
> >>> ---
> >>>  qapi/target.json     |   6 +-
> >>>  target/arm/monitor.c | 132 +++++++++++++++++++++++++++++++++++++++++++
> >>>  2 files changed, 135 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/qapi/target.json b/qapi/target.json
> >>> index 1d4d54b6002e..edfa2f82b916 100644
> >>> --- a/qapi/target.json
> >>> +++ b/qapi/target.json
> >>> @@ -408,7 +408,7 @@
> >>>  ##
> >>>  { 'struct': 'CpuModelExpansionInfo',
> >>>    'data': { 'model': 'CpuModelInfo' },
> >>> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
> >>> +  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
> >>>  
> >>>  ##
> >>>  # @query-cpu-model-expansion:
> >>> @@ -433,7 +433,7 @@
> >>>  #   query-cpu-model-expansion while using these is not advised.
> >>>  #
> >>>  # Some architectures may not support all expansion types. s390x supports
> >>> -# "full" and "static".
> >>> +# "full" and "static". Arm only supports "full".
> >>>  #
> >>>  # Returns: a CpuModelExpansionInfo. Returns an error if expanding CPU models is
> >>>  #          not supported, if the model cannot be expanded, if the model contains
> >>> @@ -447,7 +447,7 @@
> >>>    'data': { 'type': 'CpuModelExpansionType',
> >>>              'model': 'CpuModelInfo' },
> >>>    'returns': 'CpuModelExpansionInfo',
> >>> -  'if': 'defined(TARGET_S390X) || defined(TARGET_I386)' }
> >>> +  'if': 'defined(TARGET_S390X) || defined(TARGET_I386) || defined(TARGET_ARM)' }
> >>>  
> >>>  ##
> >>>  # @CpuDefinitionInfo:
> >>> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> >>> index 41b32b94b258..19e3120eef95 100644
> >>> --- a/target/arm/monitor.c
> >>> +++ b/target/arm/monitor.c
> >>> @@ -23,7 +23,13 @@
> >>>  #include "qemu/osdep.h"
> >>>  #include "hw/boards.h"
> >>>  #include "kvm_arm.h"
> >>> +#include "qapi/error.h"
> >>> +#include "qapi/visitor.h"
> >>> +#include "qapi/qobject-input-visitor.h"
> >>>  #include "qapi/qapi-commands-target.h"
> >>> +#include "qapi/qmp/qerror.h"
> >>> +#include "qapi/qmp/qdict.h"
> >>> +#include "qom/qom-qobject.h"
> >>>  
> >>>  static GICCapability *gic_cap_new(int version)
> >>>  {
> >>> @@ -82,3 +88,129 @@ GICCapabilityList *qmp_query_gic_capabilities(Error **errp)
> >>>  
> >>>      return head;
> >>>  }
> >>> +
> >>> +static const char *cpu_model_advertised_features[] = {
> >>> +    "aarch64", "pmu",
> >>> +    NULL
> >>> +};
> >>> +
> >>> +CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
> >>> +                                                     CpuModelInfo *model,
> >>> +                                                     Error **errp)
> >>> +{
> >>> +    CpuModelExpansionInfo *expansion_info;
> >>> +    const QDict *qdict_in = NULL;
> >>> +    QDict *qdict_out;
> >>> +    ObjectClass *oc;
> >>> +    Object *obj;
> >>> +    const char *name;
> >>> +    int i;
> >>> +
> >>> +    if (type != CPU_MODEL_EXPANSION_TYPE_FULL) {
> >>> +        error_setg(errp, "The requested expansion type is not supported.");
> >>> +        return NULL;
> >>> +    }
> >>> +
> >>> +    if (!kvm_enabled() && !strcmp(model->name, "host")) {
> >>> +        error_setg(errp, "The CPU definition '%s' requires KVM", model->name);
> >>> +        return NULL;
> >>> +    }
> >>> +
> >>> +    oc = cpu_class_by_name(TYPE_ARM_CPU, model->name);
> >>> +    if (!oc) {
> >>> +        error_setg(errp, "The CPU definition '%s' is unknown.", model->name);
> >>> +        return NULL;
> >>> +    }
> >>> +
> >>> +    if (kvm_enabled()) {
> >>> +        const char *cpu_type = current_machine->cpu_type;
> >>> +        int len = strlen(cpu_type) - strlen(ARM_CPU_TYPE_SUFFIX);
> >>> +        bool supported = false;
> >>> +
> >>> +        if (!strcmp(model->name, "host") || !strcmp(model->name, "max")) {
> >>> +            /* These are kvmarm's recommended cpu types */
> >>> +            supported = true;
> >>> +        } else if (strlen(model->name) == len &&
> >>> +                   !strncmp(model->name, cpu_type, len)) {
> >>> +            /* KVM is enabled and we're using this type, so it works. */
> >>> +            supported = true;
> >>> +        }
> >>> +        if (!supported) {
> >>> +            error_setg(errp, "The CPU definition '%s' cannot "
> >> use model name instead of CPU definition?
> > 
> > I took that wording from s390x, but maybe I prefer "The CPU type..."
> > better. I'll change it for v3.
> > 
> >>> +                             "be used with KVM on this host", model->name);
> >>
> >> According to your commit mesg doesn't it mean that we fall into the
> >> simplification you mentionned and not necessarily that the model name
> >> cannot be used along with KVM?
> > 
> > There's no way to know that. The simplification is meant to avoid having
> > to know which models will work with KVM, because most don't, but some do.
> > Can you suggest wording you'd prefer if you don't want to make the error
> > message so absolute? I think I prefer keeping it simple like this and
> > just saying it doesn't work.
> > 
> >>
> >>> seattle you could use 'host' for the current type, but then attempt to
> >>> query 'cortex-a57', which is also a valid CPU type to use with KVM on
> >>> seattle hosts, but that query will fail with our simplifications
> >>> +            return NULL;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    if (model->props) {
> >>> +        qdict_in = qobject_to(QDict, model->props);
> >>> +        if (!qdict_in) {
> >>> +            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
> >>> +            return NULL;
> >>> +        }
> >>> +    }
> >>> +
> >>> +    obj = object_new(object_class_get_name(oc));
> >>> +
> >>> +    if (qdict_in) {
> >>> +        Visitor *visitor;
> >>> +
> >>> +        visitor = qobject_input_visitor_new(model->props);
> >>> +        visit_start_struct(visitor, NULL, NULL, 0, errp);
> >>> +        if (*errp) {
> >> Normally we shouldn't do that as errp can be NULL. see /include/qapi/error.h
> >> I see the same in cpu_model_from_info() by the way (s390x/cpu_models.c)
> >> Maybe you can guarantee that errp isn't NULL but ...
> > 
> > Yeah, I know about the errp NULL thing, which is why I use local_err
> > elsewhere. I decided to follow s390x here though because I'm guessing
> > our QMP function will never be called with a NULL errp, it just
> > wouldn't work that way. Would you be satisfied with an assert(errp)
> > at the top of the function? Or should I switch all these to local_err
> > and then propagate?
> > 
> >>> +            object_unref(obj);
> >>> +            return NULL;
> >>> +        }
> >>> +
> >>> +        i = 0;
> >>> +        while ((name = cpu_model_advertised_features[i++]) != NULL) {
> >>> +            if (qdict_get(qdict_in, name)) {
> >>> +                object_property_set(obj, visitor, name, errp);
> >>> +                if (*errp) {> +                    break;
> >> I don't really get why we don't continue here instead of break. I see
> >> that later we read the props back and populate the qdict_out object
> > 
> > If we get an error here we're done and want to report it. If we continued
> > we'd lose that error with the next object_property_set() call. See a few
> > lines below where we free memory and return NULL due to this error.
> 
> By the way, if you were to use local_err, you could propagate them
> successively to errp and you wouldn't loose any of them. This would
> allow to report several errors at a time.
>

Interesting suggestion. I'll experiment with it, but I think the QMP error
will only provide the caller the first one anyway.

Thanks,
drew

